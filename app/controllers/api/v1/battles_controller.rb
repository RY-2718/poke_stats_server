# Battles CRUD controller
class Api::V1::BattlesController < ApplicationController
  before_action :jwt_authenticate
  before_action :set_battle, only: [:show, :update, :destroy]

  PER_PAGE = 20

  def index
    offset =
      if params.key?(:page)
        PER_PAGE * params[:page].to_i
      else
        0
      end
    battles = current_user.battles.offset(offset).limit(PER_PAGE)
    render json: battles
  end

  def show
    render json: @battle
  end

  def create
    # parameters = BattleParameter.new(json: params['_json'])
    #
    # unless parameters.valid_for_create?
    #   render json: { errors: ['入力が不正です'] }, status: :bad_request
    #   return
    # end
    #
    # battle_params = parameters.battle
    # history_params = parameters.battle_history
    # move_params = parameters.battle_history_moves
    #
    # battle = current_user.battles.new(battle_params)
    # history = battle.battle_histories.build(history_params)
    # move_params.each { |move_param| history.battle_history_moves.build(move_param) }
    #
    # if battle.save
    #   render json: battle.full_info, status: :created
    # else
    #   render json: { error: battle.errors.full_messages }, status: :conflict
    # end
  end

  def update
    # parameters = MyPokeParameter.new(json: params['_json'], battle: @battle)
    # history_params = parameters.battle_history
    # move_params = parameters.battle_history_moves
    #
    # history = @battle.dup_or_get_history
    # history.battle_history_moves.delete_all
    #
    # move_params.each { |move_param| history.battle_history_moves.build(move_param) }
    #
    # if history.update(history_params)
    #   render json: @battle.reload.full_info, status: :ok
    # else
    #   render json: { error: history.errors.full_messages }
    # end
  end

  def destroy
    if @battle.destroy
      render json: {
        result: 'success',
      }, status: :no_content
    else
      render json: {
        result: 'fail',
        errors: @battle.errors.full_messages,
      }, status: :conflict
    end
  end

  private

    def set_battle
      @battle = current_user.battles.find_by(id: params[:id])
      if @battle.nil?
        render json: {
          errors: ['データが見つかりません'],
        }, status: :bad_request
      end
    end
end
