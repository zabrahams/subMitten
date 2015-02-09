class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.includes(:journal).all
    render :index
  end

  def show
    @submission = Submission.find(params[:id])
    render :show
  end

  def new
    @journals = Journal.all
    @poems = Poem.all
    @submission = Submission.new
    render :new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.date_made = Time.now
    if @submission.save
      redirect_to submissions_url
    else
      flash[:now] = @submission.errors.full_messages
      render :new
    end
  end

  def edit
    @journals = Journal.all
    @poems = Poem.all
    @submission = Submission.includes(:journal, :poems).find(params[:id])
    render :edit
  end

  def update
    @submission = Submission.find(params[:id])

    if @submission.update(submission_params)
      redirect_to submissions_url
    else
      flash[:now] = @submission.errors.full_messages
      render :edit
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_url
  end

  def acceptance
    @submission = Submission.includes(:poems).find(params[:id])
    render :acceptance
  end

  private

  def submission_params
    params.require(:submission).permit(:journal_id, :result, poem_ids: [], accepted_poem_ids: [])
  end


end
