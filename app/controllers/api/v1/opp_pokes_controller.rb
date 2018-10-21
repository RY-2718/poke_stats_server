# OppPoke CRUD controller
class Api::V1::OppPokesController < ApplicationController
  before_action :jwt_authenticate
  before_action :set_opp_poke, only: [:update, :destroy]

  def create
    parameters = OppPokeParameter.new(json: params['_json'])

    unless parameters.valid?
      render json: { errors: ['入力が不正です'] }, status: :bad_request
      return
    end

    opp_poke_params = parameters.opp_poke
    move_params = parameters.opp_poke_moves

    opp_poke = current_user.opp_pokes.new(opp_poke_params)
    move_params.each { |move_param| opp_poke.opp_poke_moves.build(move_param) }

    if opp_poke.save
      render json: opp_poke.full_info, status: :created
    else
      render json: { error: opp_poke.errors.full_messages }
    end
  end

  def update
    parameters = OppPokeParameter.new(json: params['_json'], opp_poke: @opp_poke)
    opp_poke_params = parameters.opp_poke
    move_params = parameters.opp_poke_moves

    # TODO: トランザクションを張る
    @opp_poke.opp_poke_moves.delete_all

    move_params.each { |move_param| @opp_poke.opp_poke_moves.build(move_param) }

    if @opp_poke.update(opp_poke_params)
      render json: @opp_poke.reload.full_info, status: :ok
    else
      render json: { error: @opp_poke.errors.full_messages }
    end
  end

  def destroy
    if @opp_poke.destroy
      render json: {
        result: 'success',
      }, status: :no_content
    else
      render json: {
        result: 'fail',
        errors: @opp_poke.errors.full_messages,
      }, status: :conflict
    end
  end

  private

    def set_opp_poke
      @opp_poke = current_user.opp_pokes.find_by(id: params[:id])
      if @opp_poke.nil?
        render json: {
          errors: ['データが見つかりません'],
        }, status: :bad_request
      end
    end
end
