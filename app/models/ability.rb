# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.seller?
      can :manage, Services

    elsif user.customer?
      can :read, Services
      can :manage, Bookings
      can :manage, Reviews

    else

      can :read, Product
    end
  end
end
