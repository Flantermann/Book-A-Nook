class SpacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

<<<<<<< HEAD
=======
  def show?
    return true
  end

  def edit
    record.user == user
  end

>>>>>>> 5db6761e8ed1380db58d254dc53e3916870d23c5
  def update?
    record.user == user
    # - record:the space passed to the `authorize` method in controller
    # - user: the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
