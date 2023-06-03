# frozen_string_literal: true

class EmailSignupController < ApplicationController
  def show
    @email_signup = EmailSignup.new
  end

  def create
    @email_signup = EmailSignup.new(email_signup_params)
    partial = 'email_signup/message'
    if @email_signup.save
      flash.now[:notice] = 'Thank you for signing up!'
    else
      flash.now[:alert] = 'An error occurred. Please try again.'
    end
    render turbo_stream: turbo_stream.replace('message', partial)
  end

  private

  def email_signup_params
    params.permit(:first_name, :last_name, :email)
  end
end
