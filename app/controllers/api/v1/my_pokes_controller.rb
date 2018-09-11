class Api::V1::MyPokesController < ApplicationController
  before_action :jwt_authenticate
  # before_action :set_my_poke, only: [:show, :update, :destroy]

  PER_PAGE = 20

  def index
    my_pokes = current_user.my_poke.offset(PER_PAGE * params[:page]).limit(PER_PAGE)
    render json: my_pokes
  end

  def show
    render json: @my_poke
  end

  def create
    parameters = MyPokeParameter.new(params['_json'])
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
    parameters = MyPokeParameter.new(JSON.parse(request.body.read))
    history_params = parameters.my_poke_history
    move_params = parameters.my_poke_history_moves
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
      @my_poke = current_user.my_poke.find_by(id: params[:id])
    end
end
