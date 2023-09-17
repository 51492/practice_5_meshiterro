Rails.application.routes.draw do



  get 'post_comments/create'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resourcesメソッドはルーティングを一括して自動生成する機能 onlyでルーティングするアクションを制限できる
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end # ↑親モデルのルート記載後、do~end内に子モデルのルートを記載することで親子関係にする(ネストする)ことができる。
      # ネストするとURLが親のコントローラ名に子のコントローラ名が続くURLが生成される

  resources :users, only: [:show, :edit, :update]

  get "homes/about" => "homes#about", as: "about"
end
