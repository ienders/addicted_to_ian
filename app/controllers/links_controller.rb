class LinksController < ApplicationController

  before_filter :load_links
  before_filter :load_link, :only => [ :show, :edit, :update, :destroy ]

  def index
    @categories = Link.all_categories
    @category = params[:category]
  end
  
  def show;  end
  def edit;  end
  def new; @link = Link.new; end

  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = 'Link was successfully created.'
      redirect_to(links_url)
    else
      render :action => "index"
    end
  end

  def update
    if @link.update_attributes(params[:link])
      flash[:notice] = 'Link was successfully updated.'
      redirect_to(links_url)
    else
      render :action => "index"
    end
  end

  def destroy
    @link.destroy
    redirect_to(links_url)
  end
  
  protected
  def load_link
    @link = Link.find(params[:id])
  end
  
  def load_links; @links = Link.all; end
end
