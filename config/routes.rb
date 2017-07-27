Rails.application.routes.draw do
  get   "/saml/auth",     to: "saml_idp#new"
  get   "/saml/metadata", to: "saml_idp#show"
  post  "/saml/auth",     to: "saml_idp#create"
  match "/saml/logout",   to: "saml_idp#logout", via: [:get, :post, :delete]
end
