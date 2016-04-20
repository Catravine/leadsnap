module UsersHelper

  def new_users?
    new_amt = User.where(approved: false).count
    return new_amt == 0 ? "Users" : "Users (#{new_amt})"
  end

end
