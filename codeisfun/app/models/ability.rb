class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all                   # allow everyone to read everything

    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      can :manage, :all
    elsif user.member?
      can :read, [Problem, Comment]
      can :create, [Problem, Comment]
      can :update, Problem do |problem|
        problem.try(:user) == user
      end
      can :destroy, Problem do |problem|
        problem.try(:user) == user
      end
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == user
      end
    else
      can :read, :all
    end
    # if user && user.admin?
    #   can :access, :rails_admin       # only allow admin users to access Rails Admin
    #   can :dashboard                  # allow access to dashboard
    #   can :manage, :all
    # # else
    # #   can :read, :all
    #   if user.role? :superadmin
    #     can :manage, :all             # allow superadmins to do anything
    #   elsif user.role? :manager
    #     can :manage, [User, Product]  # allow managers to do anything to products and users
    #   elsif user.role? :sales
    #     can :update, Product, :hidden => false  # allow sales to only update visible products
    #   end
    # end
  end


end
