class SearchResultsPolicy < ApplicationPolicy

  def index?
    user.manager? || user.admin?
  end

end
