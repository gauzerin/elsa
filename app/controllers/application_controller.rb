class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  before_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
