class PicturesController < ApplicationController

  def index
    @albums = Album.all(:order => 'created_at DESC')
  end
  
  def album
    render :partial => 'album', :object => Album.find(params[:id])
  end

end
