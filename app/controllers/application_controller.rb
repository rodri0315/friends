# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # problems with DEVISE.WARDEN & around_action with I18n.with_locale
  # https://github.com/wardencommunity/warden/issues/180

  # around_action :switch_locale
  # def switch_locale(&action)
  # locale = current_user.try(:language_pref) || I18n.default_locale
  #  locale = params[:locale] || I18n.default_locale
  #  I18n.with_locale(locale, &action)
  # end

  # a recommended workaround is use before_action and I18n.locale instead
  before_action do
    # TODO: add user's language preference once db is updated
    # locale = current_user.try(:language_pref) || I18n.default_locale
    locale = params[:locale] || I18n.default_locale
    I18n.locale = locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def redirect_if_not_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  # TODO:
  # If we copied over default devise views over to views/users/ directory, then
  # each devise i18n file needs to be edited for those views.
  # The references to "devise.x" must become "users.x" in the source i18n file.

  # reference here for complete list of Rails supported locales
  # https://github.com/svenfuchs/rails-i18n

  def configure_permitted_parameters
    # byebug
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_id])
    devise_parameter_sanitizer.permit(:profile_attributes, keys: %i[first_name last_name])
    # devise_parameter_sanitizer.permit(:sign_up) do |user|
    #   user.permit(:role_id)
    #   user.permit(profile_attributes: [:first_name])
    # end
  end
end
