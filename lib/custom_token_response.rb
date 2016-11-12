# frozen_string_literal: true
module CustomTokenResponse
  def body
    additional_data = {
      'email' => set_user.email
    }

    super.merge(additional_data)
  end

  private

  def set_user
    @user ||= User.find(@token.resource_owner_id)
  end
end
