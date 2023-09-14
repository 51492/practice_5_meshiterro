class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #上記でdevise利用の機能(ユーザ登録、ログイン認証など)が使われる前にconfigure_permitted_parametersメソッドが実行される

  protected #praivateと違い、呼び出された他のコントローラーからも参照することが出来る

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
