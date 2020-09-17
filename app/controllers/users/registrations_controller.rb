# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # byebug
    super do |_user|
      club_member_role = Role.find_by system_name: 'club_member'
      @role_id = club_member_role.id
      @profile = Profile.new
      # byebug
    end
  end

  # POST /resource
  def create
    # byebug
    super do |user|
      @profile = user.build_profile(params[:profile])
      byebug
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   byebug
  #   devise_parameter_sanitizer.permit(
  #     :sign_up,
  #     keys: [
  #       :role_id,
  #     ]
  #   )
  # devise_parameter_sanitizer.permit(:profile, keys: %i[first_name last_name])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      byebug
      u.permit(:email, :password, :password_confirmation, :role_id,
               profile: %i[first_name last_name])
    end
  end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
