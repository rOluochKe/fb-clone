# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
<<<<<<< HEAD
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
=======
def facebook
  @user = User.from_omniauth(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
  else
    session['devise.facebook_data'] = request.env['omniauth.auth']
    redirect_to new_user_registration_url
  end
end
>>>>>>> 90f05d58a252165f4aaa28221ab7064c4e6e9c1d

  def failure
    redirect_to root_path
  end
end
