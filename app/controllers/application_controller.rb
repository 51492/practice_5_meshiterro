class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #上記でdevise利用の機能(ユーザ登録、ログイン認証など)が使われる前にconfigure_permitted_parametersメソッドが実行される

  def after_sign_in_path_for(resource) #after_sign_in_path_forはdeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定している。(初期値は「root_path」)引数resourceにはログインしたモデルのデータ(ログインしたUserのインスタンスが格納される)
    about_path
  end

  def after_sign_out_path_for(resource) #上記のafter_sign同様、deviseが用意しているメソッド(初期値は「root_path」)
    about_path
  end

  protected #praivateと違い、呼び出された他のコントローラーからも参照することが出来る

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #ユーザー登録情報(sign_up)に加えてnameカラムも許可
  end
end
