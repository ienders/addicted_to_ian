class PicturesController < ApplicationController

  def index
    @albums = Album.all(:order => 'created_at DESC')
  end
  
  def album
    render :partial => 'album', :object => Album.find(params[:id]), :locals => { :num_image_rows => params[:num_image_rows].to_i }
  end
  
  def photo
    render :partial => 'photo', :object => Photo.find(params[:id])
  end

end
