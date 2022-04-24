class ApplicationController < ActionController::Base
before_action :authenticate_customer!, except: [:top, :about, :public_action]
# before_action :configure_permitted_parameters, if: :devise_controller?
end
