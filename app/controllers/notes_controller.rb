class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    Note.updatebgc #Free Heroku can't run async functions or cron jobs. Cheap fix.
    @current = Note.current
    @notes = Note.filter(params.slice(:title, :description, :created_min,
                                      :created_max, :begin_min, :begin_max)).order('id DESC')
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = t(:note_created)
      redirect_to @note
    else
      render :new 
    end
  end

  def update
      if @note.update(note_params)
        flash[:success] = t(:note_updated)
        redirect_to @note
      else
        render :edit 
      end
  end

  def destroy
    @note.destroy
    flash[:success] = t(:note_deleted)
    redirect_to notes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :description, :begin, :end, :backgroundcolor)
    end
end
