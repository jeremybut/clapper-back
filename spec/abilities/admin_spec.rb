# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :ability do
  let(:user) { create(:admin_user) }
  let(:ability) { Ability.new(user) }
  subject { ability }

  it { is_expected.to have_abilities(:manage).on(:all) }
end
