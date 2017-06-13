# frozen_string_literal: true
module CustomTokenResponse
  def body
    user = User.find(@token.resource_owner_id)

    additional_data = {
      'email' => user.email,
      'id' => user.id
    }

    super.merge(additional_data)
  end
end
