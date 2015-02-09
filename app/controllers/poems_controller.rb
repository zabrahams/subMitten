class PoemsController < ApplicationController

  def index
    @poems = Poem.all
    render :index
  end

  def show
    @poem = Poem.includes(submissions: :journal).find(params[:id])
    render :show
  end

  def new
    @poem = Poem.new
    render :new
  end

  def create
    @poem = Poem.new(poem_params)
    if @poem.save
      redirect_to poem_url(@poem)
    else
      flash[:now] = @poem.errors.full_messages
      render :new
    end
  end

  def edit
    @poem = Poem.find(params[:id])
    render :edit
  end

  def update
    @poem = Poem.find(params[:id])
    if @poem.update(poem_params)
      redirect_to poem_url(@poem)
    else
      flash[:now] = @poem.errors.full_messages
      render :edit
    end
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy
    redirect_to poems_url
  end

private

def poem_params
  params.require(:poem).permit(:title, :written_on)
end


end
