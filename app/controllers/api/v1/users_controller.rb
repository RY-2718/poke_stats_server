class Api::V1::UsersController < ApplicationController
  before_action :jwt_authenticate
  before_action :user_from_params
  before_action :check_user, only: [:update, :destroy]

  def show
    render json: @user, serializer: UserSerializer
  end

  def update
    if @user.update(user_params)
      render json: {
        result: 'success'
      }, status: :no_content
    else
      render json: {
        result: 'fail',
        errors: @user.errors.full_messages
      },status: :conflict
    end
  end

  def destroy
    if @user.destroy
      render json: {
        result: 'success'
      }, status: :no_content
    else
      render json: {
        result: 'fail',
        errors: @user.errors.full_messages
      }, status: :conflict
    end
  end

  private

    def user_from_params
      @user =
        if params[:id] == 'me' && current_user
          current_user
        else
          User.find_by(id: params[:id])
        end
    end

    def user_params
      {
        username: params[:username]
      }
    end

    def check_user
      if @user != current_user # rubocop:disable Style/GuardClause
        render json: {
          status: 401,
          errors: ['自分以外のユーザの情報を書き換えることはできません']
        }, status: :unauthorized
      end
    end
end
