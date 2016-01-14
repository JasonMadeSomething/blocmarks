module UsersHelper
    
  def show_name(user)
    user == current_user ? 'My ' : "#{user.user_name}'s "
  end
    
end
