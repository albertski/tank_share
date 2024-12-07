# syntax = docker/dockerfile:1

# Use slim image for Ruby
ARG RUBY_VERSION=3.1.1
FROM ruby:$RUBY_VERSION-slim as base

# Set working directory for Rails app
WORKDIR /rails

# Set production environment variables
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Build stage to install dependencies and gems
FROM base as build

# Install build dependencies and libvips
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    curl \
    libpq-dev \
    libvips-dev \
    pkg-config \
    postgresql && \
    rm -rf /var/lib/apt/lists/*

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copy application code
COPY . .

# Precompile bootsnap code
RUN bundle exec bootsnap precompile app/ lib/

# Precompile Rails assets
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for the runtime image
FROM base

# Install runtime dependencies and libvips
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    libsqlite3-0 \
    libvips \
    postgresql-client \
    curl \
    vim && \
    rm -rf /var/lib/apt/lists/*

# Copy built artifacts
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Create a non-root user for security
RUN useradd rails --home /rails --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint to initialize database
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expose port 3000 for Rails server
EXPOSE 3000

# Default command to run the Rails server
CMD ["./bin/thrust", "./bin/rails", "server"]
