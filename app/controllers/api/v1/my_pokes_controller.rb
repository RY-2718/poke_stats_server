class Api::V1::MyPokesController < ApplicationController
  before_action :jwt_authenticate
  before_action :set_my_poke, only: [:show, :update, :destroy]

  PER_PAGE = 20

  def index
    offset =
      if params.key?(:page)
        PER_PAGE * params[:page].to_i
      else
        0
      end
    my_pokes = current_user.my_pokes.offset(offset).limit(PER_PAGE)
    render json: my_pokes
  end

  def show
    render json: @my_poke
  end

  def create
    parameters = MyPokeParameter.new(json: params['_json'])

    unless parameters.valid_for_create?
      render json: { errors: ['入力が不正です'] }, status: :bad_request
      return
    end

    my_poke_params = parameters.my_poke
    history_params = parameters.my_poke_history
    move_params = parameters.my_poke_history_moves

    my_poke = current_user.my_pokes.new(my_poke_params)
    history = my_poke.my_poke_histories.build(history_params)
    move_params.each { |move_param| history.my_poke_history_moves.build(move_param) }

    if my_poke.save
      render json: my_poke.full_info, status: :created
    else
      render json: { error: my_poke.errors.full_messages }, status: :conflict
    end
  end

  def update
    parameters = MyPokeParameter.new(json: params['_json'], my_poke: @my_poke)
    history_params = parameters.my_poke_history
    move_params = parameters.my_poke_history_moves

    history = @my_poke.dup_or_get_history
    history.my_poke_history_moves.delete_all

    move_params.each { |move_param| history.my_poke_history_moves.build(move_param) }

    if history.update(history_params)
      render json: @my_poke.reload.full_info, status: :ok
    else
      render json: { error: history.errors.full_messages }
    end
  end

  def destroy
    if @my_poke.destroy
      render json: {
        result: 'success',
      }, status: :no_content
    else
      render json: {
        result: 'fail',
        errors: @my_poke.errors.full_messages,
      }, status: :conflict
    end
  end

  private

    def set_my_poke
      @my_poke = current_user.my_pokes.find_by(id: params[:id])
      if @my_poke.nil?
        render json: {
          errors: ['データが見つかりません'],
        }, status: :bad_request
      end
    end
end
