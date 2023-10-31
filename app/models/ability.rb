class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food, public: true
    can :read, Recipe, public: true
    return unless user.present?

    can :manage, Food, user_id: user.id
    can :manage, Recipe, user_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
