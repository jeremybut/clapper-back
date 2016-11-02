# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  firstname       :string
#  lastname        :string
#  email           :string
#  password_digest :string
#  token           :string
#  settings        :jsonb            not null
#

class User < ApplicationRecord
  include Storext.model

  has_secure_token
  has_secure_password

  validates :email, presence: true

  store_attributes :settings do
    db_name String
    db_username String
    db_password String
    db_host String
    db_port Integer
  end
end
