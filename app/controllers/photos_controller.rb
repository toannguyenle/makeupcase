class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo =Photo.new
  end
  def create
    @photo =Photo.new
    # Find our parent decision that we should attach to
    @photo = current_user.photos.new(photo_params)
    @photo.date ||= DateTime.now
    # Attach this criterion to a decision
    if @photo.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end
  
  def show

  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end