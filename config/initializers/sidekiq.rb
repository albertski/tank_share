unless Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' }  # Use writable Redis URL
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0' }
  end
end
