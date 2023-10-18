# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@tankshare.net'
  layout 'mailer'
end
