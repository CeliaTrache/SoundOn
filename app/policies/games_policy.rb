class GamesPolicy < ApplicationPolicy
  
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def new?
      return true
    end

    def create?
      return true
    end

    def edit?
      return true
    end

    def update?
      return true
    end

    def show?
      return true
    end

    def solution?
      return true
    end

    def result?
      return true
    end
end