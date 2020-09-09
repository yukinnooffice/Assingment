class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
    #sign in後のredirect先変更
    def after_sign_in_path_for(resource)
      user_path(resource)
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
      root_path
    end

    #sin up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profle_image, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時にnameを使用
    end
    def correct_user?(user)
      if current_user.nil?
        return false
      else
        user.id.equal?(current_user.id)
      end
    end
end
