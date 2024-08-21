class CargoPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5
  def index?
    user.admin? || user.gestor_de_rh?
  end

  def show?
    user.admin? || user.gestor_de_rh?
  end

  def create?
    user.admin? || user.gestor_de_rh?
  end

  def update?
    user.admin? || user.gestor_de_rh?
  end

  def destroy?
    user.admin? || user.gestor_de_rh?
  end

  private

  def user_admin?
    user.admin?
  end
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
