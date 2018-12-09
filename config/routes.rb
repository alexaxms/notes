Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    resources :notes
    root 'notes#index'
  end
end
