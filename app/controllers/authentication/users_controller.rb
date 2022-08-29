class Authentication::UsersController < ApplicationController
    skip_before_action :protect_pages
    def new
        @user = User.new
    end
    def create
        pp user_params
        @user = User.new (user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            render :new ,status: :unprocessable_entity
        end
    end
    def user_params
        params.require(:user).permit(:email,:username,:password,:telefono,:nombre)
    end
end