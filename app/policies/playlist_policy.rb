class PlaylistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create_tracks?
    return true
  end
end
