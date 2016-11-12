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

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  include Storext.model
  rolify

  validates :email, presence: true

  store_attributes :settings do
    db_name String
    db_username String
    db_password String
    db_host String
    db_port Integer
  end
end
