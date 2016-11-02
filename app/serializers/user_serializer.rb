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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :lastname, :firstname, :created_at
end
