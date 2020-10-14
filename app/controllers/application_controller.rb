class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Event.ransack(params[:q]) #ransackメソッド推奨
    @search_events = @search.result.page(params[:page]).per(5)
  end

  protected
    def after_sign_in_path_for(resource)
      events_path(resource)
    end

    def after_sign_out_path_for(resource)
      root_path
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
