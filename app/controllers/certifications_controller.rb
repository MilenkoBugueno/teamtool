class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @certifications = Certification.all
    respond_with(@certifications)
  end

  def show
    respond_with(@certification)
  end

  def new
    @certification = Certification.new
    respond_with(@certification)
  end

  def edit
  end

  def create
    @certification = Certification.new(certification_params)
    flash[:notice] = 'Certification was successfully created.' if @certification.save
    respond_with(@certification)
  end

  def update
    flash[:notice] = 'Certification was successfully updated.' if @certification.update(certification_params)
    respond_with(@certification)
  end

  def destroy
    @certification.destroy
    respond_with(@certification)
  end

  private
    def set_certification
      @certification = Certification.find(params[:id])
    end

    def certification_params
      params.require(:certification).permit(:title, :short_name, :description, :peer_approvements, :level_id, :move_type_id, :moves_goal, :duration)
    end
end
