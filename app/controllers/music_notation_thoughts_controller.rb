class MusicNotationThoughtsController < ApplicationController
  layout nil
  
  def index
    @music_notation_thoughts = MusicNotationThought.all
    respond_to do |format|
      format.html
      format.json  { render :json => @music_notation_thoughts }
      format.xml  { render :xml => @music_notation_thoughts }
    end
  end
  
  def show
    @music_notation_thought = MusicNotationThought.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @music_notation_thought }
      format.xml  { render :xml => @music_notation_thought }
    end
  end
  
  def new
    @music_notation_thought = MusicNotationThought.new
  end
  
  def create
    @music_notation_thought = MusicNotationThought.new(params[:music_notation_thought])
    if @music_notation_thought.save
      flash[:notice] = "Successfully created music notation thought."
      respond_to do |format|
        format.html { redirect_to @music_notation_thought }
        format.xml  { render :xml => @music_notation_thought }
        format.json  { render :json => @music_notation_thought }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.all  do
          render :text => 'Could not save music notation thought.', :status => :internal_server_error 
        end
      end
    end
  end
  
  def edit
    @music_notation_thought = MusicNotationThought.find(params[:id])
  end
  
  def update
    @music_notation_thought = MusicNotationThought.find(params[:id])
    if @music_notation_thought.update_attributes(params[:music_notation_thought])
      flash[:notice] = "Successfully updated music notation thought."
      respond_to do |format|
        format.html { redirect_to @music_notation_thought }
        format.xml  { render :xml => @music_notation_thought }
        format.json  { render :json => @music_notation_thought }
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit'}
        format.all  do
          render :text => 'Could not save music notation thought.', :status => :internal_server_error 
        end
      end
    end
  end
  
  def destroy
    @music_notation_thought = MusicNotationThought.find(params[:id])
    @music_notation_thought.destroy
    flash[:notice] = "Successfully destroyed music notation thought."
    
    respond_to do |format|
      format.html { redirect_to music_notation_thoughts_url }
      format.all  do
        render :text => 'Destroyed music notation thought.', :status => :success 
      end
    end
  end
end
