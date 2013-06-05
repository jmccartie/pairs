class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.role
    when "Super Admin"
      can :manage, :dashboard
      can :manage, User
      can :manage, :zone
      can :manage, :wo_status
      can :manage, Need
      can :manage, Pod
      can :manage, Comment
    when "User"
      can :manage, Comment, :user_id => user.id
    else
      can :read, Need
    end

  end
end
