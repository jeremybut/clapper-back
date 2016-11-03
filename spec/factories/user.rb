# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com" }
    password '12345678'
    password_confirmation '12345678'
    db_name 'test'
    db_username 'test'
    db_password 'test'
    db_host 'test'
    db_port 3306

    factory :admin_user do
      is_admin true
    end
  end
end
