class UsersController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request,
    only: :create
  before_action :set_user, only: [:create, :show , :update, :destroy]
  def index
    if params[:me].present?
      user = User.find(@current_user.id)
      render json: user, status: 200
    else
      users = User.all
      render json: users, status: 200
    end
  end
  def show
    user =  User.find(params[:id]);
    if user
      render json: user, status: 200
    else
      render json: {errors: "no such user"},
        status: 404

    end
  end
  def update
    if @user.update_attributes(user_params)
      render json: @user, status: 200
    else
      render json: {errors: "no such user"},
        status: 404
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: @user.errors , status: :unprocessable_entity
    end

  end
  private

  def set_user
    @user = User.find(params[:id]);

  end

    def user_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end

