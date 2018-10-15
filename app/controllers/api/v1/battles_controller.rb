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
    parameters = BattleParameter.new(json: params['_json'], user: current_user)

    battle = current_user.battles.new(parameters.battle)
    parameters.battle_my_poke_history.each { |v| battle.battle_my_poke_histories.build(v) }
    parameters.battle_opp_poke.each { |v| battle.battle_opp_pokes.build(v) }

    if battle.save
      render json: battle, status: :created
    else
      render json: { error: battle.errors.full_messages }
    end
  end

  def update
    parameters = BattleParameter.new(json: params['_json'], user: current_user, battle: @battle)
    battle_params = parameters.battle
    battle_my_poke_history_params = parameters.battle_my_poke_history
    battle_opp_poke_params = parameters.battle_opp_poke

    @battle.battle_my_poke_histories.delete_all
    @battle.battle_opp_pokes.delete_all
    battle_my_poke_history_params.each { |v| @battle.battle_my_poke_histories.build(v) }
    battle_opp_poke_params.each { |v| @battle.battle_opp_pokes.build(v) }

    if @battle.update!(battle_params)
      render json: @battle
    else
      render json: { error: @battle.errors.full_messages }
    end
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
