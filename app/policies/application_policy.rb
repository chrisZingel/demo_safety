# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    is_admin? || false
  end

  def new?
    create?
  end

  def update?
    is_admin? || false
  end

  def edit?
    update?
  end

  def destroy?
    is_admin? || false
  end

  def is_admin?
    user.role =="admin"
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
