class PlaylistPolicy < ApplicationPolicy
  #class Scope < Scope
    #def resolve
      #scope.all
    #end

    def index?
      return true
    end
  end
end
