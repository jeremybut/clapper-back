# frozen_string_literal: true
describe 'API Users' do
  describe 'GET /api/v1/users' do
    let!(:user) { create :admin_user }
    let!(:user_2) { create :user }

    it 'returns Users' do
      get_as_user '/api/v1/users'

      # expect(json['users']).to match_array(
      # [user_helper(user), user_helper(user_2)])
      expect(response.status).to eq 200
    end
  end
end
