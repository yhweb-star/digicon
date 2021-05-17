class AbsencesController < ApplicationController
  before_action :move_to_index

  def index
    @absences = Absence.includes(:user).order("created_at DESC")
  end

  def new
    @absence = Absence.new
  end

  def create
    @absence = Absence.create(absence_params)
    if @absence.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def absence_params
    params.require(:absence).permit(:date_when, :reason_id, :time_when, :status).merge(user_id: current_user.id)
  end

  def move_to_index
    unless school_signed_in? || user_signed_in?
      redirect_to root_path
    end
  end
  
end
