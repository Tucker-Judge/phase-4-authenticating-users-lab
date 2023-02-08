class LoginController < ApplicationController
    def create
        user = User.find_by(username: params_user)
        session[:user_id] = user.id
        render json: user
    end
    def destroy
        session.delete :user_id
        head :no_content
    end
    def prime
        user = User.find(session[:user_id])
        render json: user
    end
    private
    def params_user
        params.permit(:username)
    end
end
