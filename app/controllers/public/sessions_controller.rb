# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  
  def after_sign_in_path_for(resource)
    homes_top_path
  end
  
  def after_sign_out_path_for(resource)
    homes_top_path
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #未テスト
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        redirect_to new_customer_registration
      else
        
      end
  end
  


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
