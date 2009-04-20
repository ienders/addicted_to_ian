class AlbumsController < ApplicationController
  
  before_filter :login_required
  before_filter :load_album, :only => [ :edit, :update, :destroy ]
  
  def new
    @album = Album.new
  end
  
  def new_photo_field
    render :partial => 'photo_fields', :locals => { :num => params[:num] }
  end

  def edit; end

  def create
    logger.debug("Params = #{params.inspect}")
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = 'Album was successfully created.'
      redirect_to(edit_album_url(@album))
    else
      render :action => "new"
    end
  end

  def update
    if @album.update_attributes(params[:album])
      flash[:notice] = 'Album was successfully updated.'
      redirect_to(albums_url)
    else
      render :action => "index"
    end
  end

  def destroy
    @album.destroy
    redirect_to(albums_url)
  end
  
  protected
  def load_album
    @album = Album.find(params[:id])
  end
end
