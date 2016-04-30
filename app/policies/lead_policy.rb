class LeadPolicy < ApplicationPolicy

  def index?
    !user.standard?
  end

end
