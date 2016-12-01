# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :movie
      can :manage, User
    else
      can :manage, :movie
      can :manage, User, id: user.id
    end
  end
end
