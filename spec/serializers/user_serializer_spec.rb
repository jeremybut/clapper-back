# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  settings               :jsonb            not null
#

# require 'rails_helper'

# describe UserSerializer do
#   let(:attributes) { FactoryGirl.attributes_for(resource_name) }

#   it { should have_key(:id) }
#   it { should have_key(:email) }
#   it { should have_key(:db_name) }
#   it { should have_key(:db_username) }
#   it { should have_key(:db_password) }
#   it { should have_key(:db_host) }
#   it { should have_key(:db_port) }
#   it { should have_key(:created_at) }
# end
