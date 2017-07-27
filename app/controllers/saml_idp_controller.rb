class SamlIdpController < SamlIdp::IdpController

  def idp_authenticate(email, password) # not using params intentionally
    user = User.by_email(email).first
    user && user.valid_password?(password) ? user : nil
  end

  private :idp_authenticate

  def idp_make_saml_response(found_user) # not using params intentionally
    # NOTE encryption is optional
    encode_response found_user, encryption: {
      cert: saml_request.service_provider.cert,
      block_encryption: 'aes256-cbc',
      key_transport: 'rsa-oaep-mgf1p'
    }
  end

  private :idp_make_saml_response

  def idp_logout
    user = User.by_email(saml_request.name_id)
    user.logout
  end

  private :idp_logout
end
