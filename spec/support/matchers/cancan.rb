# frozen_string_literal: true
RSpec::Matchers.define :have_abilities do |actions|
  include HaveAbilitiesMixin
  chain :on do |obj|
    @obj = obj
  end

  match do |ability|
    verify_ability_type(ability)
    @expected_hash = build_expected_hash(actions, default_expectation: true)
    @actual_hash = {}
    @expected_hash.each do |action, _|
      @actual_hash[action] = ability.can?(action, @obj)
    end
    @actual_hash == @expected_hash
  end

  description do
    obj_name = @obj.class.name
    if [Class, Module, Symbol].include?(@obj.class)
      obj_name =
        @obj.to_s.capitalize
    end
    "have abilities #{@expected_hash.keys.join(', ')} on #{obj_name}"
  end

  failure_message do
    obj_name = @obj.class.name
    if [Class, Module, Symbol].include?(@obj.class)
      obj_name =
        @obj.to_s.capitalize
    end
    "expected user to have abilities:
      #{@expected_hash} for #{obj_name}, but got #{@actual_hash}"
  end
end

RSpec::Matchers.define :not_have_abilities do |actions|
  include HaveAbilitiesMixin
  chain :on do |obj|
    @obj = obj
  end

  match do |ability|
    verify_ability_type(ability)
    if actions.is_a?(Hash)
      raise ArgumentError,
            'You cannot pass a hash to not_have_abilities.
            Use have_abilities instead.'
    end
    @expected_hash = build_expected_hash(actions, default_expectation: false)
    @actual_hash = {}
    @expected_hash.each do |action, _|
      @actual_hash[action] = ability.can?(action, @obj)
    end
    @actual_hash == @expected_hash
  end

  description do
    obj_name = @obj.class.name
    if [Class, Module, Symbol].include?(@obj.class)
      obj_name =
        @obj.to_s.capitalize
    end
    if @expected_hash.present?
      "not have abilities #{@expected_hash.keys.join(', ')}
      on #{obj_name}"
    end
  end

  failure_message do
    obj_name = @obj.class.name
    if [Class, Module, Symbol].include?(@obj.class)
      obj_name =
        @obj.to_s.capitalize
    end
    "expected user NOT to have abilities #{@expected_hash.keys.join(', ')}
    for #{obj_name}, but got #{@actual_hash}"
  end
end

module HaveAbilitiesMixin
  def build_expected_hash(actions, default_expectation:)
    return actions if actions.is_a?(Hash)
    expected_hash = {}
    if actions.is_a?(Array)
      # If given an array like [:create, read] build a hash like:
      # {create: default_expectation, read: default_expectation}
      actions.each { |action| expected_hash[action] = default_expectation }
    elsif actions.is_a?(Symbol)
      # Build a hash if it's just a symbol.
      expected_hash = { actions => default_expectation }
    end
    expected_hash
  end

  def verify_ability_type(ability)
    return if ability.class.ancestors.include?(CanCan::Ability)
    raise TypeError, "subject must mixin CanCan::Ability,
    got a #{ability.class.name} class."
  end
end
