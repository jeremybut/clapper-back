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
    kodi_username String
    kodi_password String
    kodi_host String
    kodi_port Integer
  end

  def host
    "#{kodi_host}:#{kodi_port}"
  end
end
