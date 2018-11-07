class WalletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def new?
    create?
  end

  def create?
   record.user == user
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def delete?
    record.user == user
  end
end
