class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #deviseを利用する機能の時実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    # サインアップ時にusernameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image])
    # アカウント編集の時にusernameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image])
  end
  
  def after_update_path_for(*)
    user_path(@user)
  end
  
  def after_sign_in_path_for(resource)
    user_path(@user) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path 
  end
  
end
