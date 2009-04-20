class PhotosController < ApplicationController
  
  before_filter :login_required
  before_filter :load_photo, :only => [ :edit, :update, :destroy ]
  
  def new; @photo = Photo.new; end
  def edit; end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to(photos_url)
    else
      render :action => "index"
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
      redirect_to(photos_url)
    else
      render :action => "index"
    end
  end

  def destroy
    @photo.destroy
    redirect_to(photos_url)
  end
  
  protected
  def load_photo
    @photo = Photo.find(params[:id])    
  end
end