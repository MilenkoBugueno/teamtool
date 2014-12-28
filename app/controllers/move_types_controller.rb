class MoveTypesController < ApplicationController
  before_action :set_move_type, only: [:show, :edit, :update, :destroy]

  def index
    @move_types = MoveType.all
    respond_with(@move_types)
  end

  def show
    respond_with(@move_type)
  end

  def new
    @move_type = MoveType.new
    respond_with(@move_type)
  end

  def edit
  end

  def create
    @move_type = MoveType.new(move_type_params)
    flash[:notice] = 'MoveType was successfully created.' if @move_type.save
    respond_with(@move_type)
  end

  def update
    flash[:notice] = 'MoveType was successfully updated.' if @move_type.update(move_type_params)
    respond_with(@move_type)
  end

  def destroy
    @move_type.destroy
    respond_with(@move_type)
  end

  private
    def set_move_type
      @move_type = MoveType.find(params[:id])
    end

    def move_type_params
      params.require(:move_type).permit(:title, :icon_path, :sprint, :day_plan, :user_story)
    end
end
