class PicturesController < ApplicationController

  def index
    @albums = Album.all(:order => 'created_at DESC')
  end

end
