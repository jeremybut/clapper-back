# frozen_string_literal: true
Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  access_token_expires_in 1.day

  use_refresh_token

  # This block will be called to check whether the
  # resource owner is authenticated or not.
  resource_owner_authenticator do
    raise "Please configure doorkeeper
      resource_owner_authenticator block located in #{__FILE__}"
  end

  resource_owner_from_credentials do |_routes|
    user = User.find_for_database_authentication(email: params[:email])
    user if user&.valid_for_authentication? do
      user.valid_password?(params[:password])
    end
  end

  grant_flows %w(password client_credentials)
end
