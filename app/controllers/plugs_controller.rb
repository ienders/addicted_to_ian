class PlugsController < ApplicationController

  before_filter :load_plug, :only => [ :edit, :update, :destroy ]
  
  def index
    @plugs = Plug.all(:order => 'updated_at DESC')
  end

  def edit;  end

  def create
    @plug = Plug.new(params[:plug])
    if @plug.save
      flash[:notice] = 'Plug was successfully created.'
      redirect_to(:action => 'index')
    else
      render :action => "index"
    end
  end

  def update
    if @plug.update_attributes(params[:plug])
      flash[:notice] = 'Plug was successfully updated.'
      redirect_to(:action => 'index')
    else
      render :action => "index"
    end
  end
  
  def destroy
    @plug.destroy
    redirect_to(:action => 'index')
  end
  
  protected
  def load_plug
    @plug = Plug.find(params[:id])
  end
  
end
