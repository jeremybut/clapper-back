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
#  is_admin               :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  settings               :jsonb            not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :is_admin, :db_name, :db_username,
             :db_password, :db_host, :db_port, :created_at

  link(:self) { api_v1_user_url(object) }
end
