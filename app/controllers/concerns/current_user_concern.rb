module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[:user_id]
      # all methods in this app can just check if we have a user in the session and if so create an instance variable
      # that can be accessed in different views.
      @current_user = User.find(session[:user_id]) # set instance variable
    end
  end
end