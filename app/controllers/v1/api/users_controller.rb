class V1::Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def search_by_email
        users = User.all

        if users.any?
          user_details = users.map do |user|
            {
              id: user.id,
              username: user.name,
              email: user.email
            }
          end
      
          render json: { users: user_details }, status: :ok
        else
          render json: { error: "No users found" }, status: :not_found
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
