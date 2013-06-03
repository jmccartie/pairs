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
      end
    end
  end
end
