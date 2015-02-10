class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to url_for(@note.notable)
    else
      flash[notices] << @note.errors.full_messages
      redirect_to url_for(@note.notable)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @notable = @note.notable
    @note.destroy
    redirect_to url_for(@notable)
  end

  private

  def note_params
    params.require(:note).permit(:body, :notable_type, :notable_id)
  end

end
