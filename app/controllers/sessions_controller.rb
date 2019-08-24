class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    # We have a user model which we find by email
    # params[user][email] is what the front-end sends because it wraps up a User domain object with an email field.
    # it is possible we do not wrap the sent form contents into a User object and where we just send the email field
    # for the try authenticate, this is a method built into rails and it can be used because in user.rb we stated
    # "has_secure_password"
    # so we try to find a user with the passed in email and then we try to verify the password.
    # if all of this works then we store the user into this user variable.
    user = User.
              find_by(email: params["user"]["email"])
               .try(:authenticate, params["user"]["password"])
    if user
      # in the http cookie we will send back the retrieved user's database id.
      # this id that is returned is encrypted and sent back to the user's browser.
      session[:user_id] = user.id
      render json: {
          status: :created,
          logged_in: true,
          user: user
      }
    else
      render json: {
          status: 401 # unauthorized
      }
    end
  end

  def logged_in
    if @current_user
      render json: {
          logged_in: true,
          user: @current_user
      }
    else
      render json: {
          logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
        status: 200,
        logged_out: true # can be useful as we can send this back to the front-end so we know the user has been logged out.
    }
  end
end