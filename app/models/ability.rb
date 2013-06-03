class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role.present?
      if user.role_id > 1
        can :read, WorkOrder
      end
      if user.role_id > 8
        can :manage, :dashboard
        can :manage, :zone
        can :manage, :role
        can :manage, :wo_status
        can :manage, WorkOrder
      end
    end
  end
end
