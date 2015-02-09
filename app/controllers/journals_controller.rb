class JournalsController < ApplicationController

  def index
    @journals = Journal.all
    render :index
  end

  def show
    @journal = Journal.includes(submissions: :poems,).find(params[:id])
    render :show
  end

  def new
    @journal = Journal.new
    render :new
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      redirect_to journals_url
    else
      flash[:now] = @journal.errors.full_messages
    end
  end

  def edit
    @journal = Journal.find(params[:id])
    render :edit
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update(journal_params)
      redirect_to journals_url
    else
      flash[:now] = @journal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    redirect_to journals_url
  end

  private

  def journal_params
    params.require(:journal).permit(:name, :email, :url, :address, :simul_submit, :phone_number)
  end

end
