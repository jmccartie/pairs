class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role.present?
      if user.role_id > 1
        can :read, Need
      end
      if user.role.title = "Super Admin"
        can :manage, :dashboard
        can :manage, User
        can :manage, :zone
        can :manage, :role
        can :manage, :wo_status
        can :manage, Need
      end
    end
  end
end
