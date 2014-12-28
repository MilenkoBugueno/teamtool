class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @moves = Move.all
    respond_with(@moves)
  end

  def show
    respond_with(@move)
  end

  def new
    @move = Move.new
    @move_type = MoveType.find(params[:move_type_id]) if params[:move_type_id].present?
    respond_with(@move)
  end

  def edit
  end

  def create
    @move = Move.new(move_params)
    flash[:notice] = 'Move was successfully created.' if @move.save
    respond_with(@move)
  end

  def update
    flash[:notice] = 'Move was successfully updated.' if @move.update(move_params)
    respond_with(@move)
  end

  def destroy
    @move.destroy
    respond_with(@move)
  end

  private
    def set_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:title, :description, :results, :start_date, :end_date, :user_id, :project_id, :category_id, :inscription_id, :container_id, :move_type_id)
    end
end
