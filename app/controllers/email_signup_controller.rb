# frozen_string_literal: true

class EmailSignupController < ApplicationController
  def show
    @email_signup = EmailSignup.new
  end

  def create
    @email_signup = EmailSignup.new(email_signup_params)
    if @email_signup.save
      flash.now[:notice] = "Thank you #{first_name} for signing up!"
    else
      flash.now[:alert] = 'An error occurred. Please try again.'
    end
    render turbostream
  end

  private

  def email_signup_params
    params.require(:email_signup).permit(:first_name, :last_name, :email)
  end

  def first_name
    @email_signup.first_name
  end

  def message_partial
    render_to_string(partial: 'email_signup/message')
  end

  def form_partial
    render_to_string(partial: 'email_signup/form',
                     locals: { email_signup: @email_signup })
  end

  def turbostream
    {
      turbo_stream: [
        turbo_stream.replace('email_signup_message', message_partial),
        turbo_stream.replace('email_signup_form', form_partial)
      ]
    }
  end
end
