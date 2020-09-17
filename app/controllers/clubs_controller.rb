class ClubsController < ApplicationController

  before_action :redirect_if_not_signed_in

  # guide to Internationalization (I18n)
  # https://guides.rubyonrails.org/i18n.html
  def index
    # flash[:notice] = t(:hello_flash)
    
  end
end
