Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "es"} do
    resources :notes
    root 'notes#index'
  end
end
