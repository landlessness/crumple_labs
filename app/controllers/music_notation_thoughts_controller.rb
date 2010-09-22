class MusicNotationThoughtsController < ApplicationController
  def index
    @music_notation_thoughts = MusicNotationThought.all
    respond_to do |format|
      format.html
      format.json  { render :json => @music_notation_thoughts }
    end
  end
  
  def show
    @music_notation_thought = MusicNotationThought.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @music_notation_thought }
    end
  end
  
  def new
    @music_notation_thought = MusicNotationThought.new
  end
  
  def create
    @music_notation_thought = MusicNotationThought.new(params[:music_notation_thought])
    if @music_notation_thought.save
      flash[:notice] = "Successfully created music notation thought."
      redirect_to @music_notation_thought
    else
      render :action => 'new'
    end
  end
  
  def edit
    @music_notation_thought = MusicNotationThought.find(params[:id])
  end
  
  def update
    @music_notation_thought = MusicNotationThought.find(params[:id])
    if @music_notation_thought.update_attributes(params[:music_notation_thought])
      flash[:notice] = "Successfully updated music notation thought."
      redirect_to @music_notation_thought
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @music_notation_thought = MusicNotationThought.find(params[:id])
    @music_notation_thought.destroy
    flash[:notice] = "Successfully destroyed music notation thought."
    redirect_to music_notation_thoughts_url
  end
end
