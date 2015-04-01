module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def user_type user
    if user.role == "admin"
      return "Admin"
    else
      return "Trainee"
    end
  end
  
  def user_admin?
    current_user.role == "admin"
  end
end