class Authentication::SessionsController < ApplicationController
    skip_before_action :protect_pages
    def new
        @user = User.new
    end
    def create
        @user = User.find_by("email = :login OR username = :login", {login: params[:correo]})        
        # pp @user 
        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            # redirect_to home_path, notice: t('Creado')
            redirect_to '/home' 
        else
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
        reset_session
        redirect_to '/' 
    end
end