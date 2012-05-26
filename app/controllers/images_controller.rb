class ImagesController < ApplicationController
  require "rmagick"
  # include Magick

  def index
    @images = current_user.images
  end
  
  def new
    @image = current_user.images.build
  end
  
  def create
    if params[:image].class.to_s == "ActionDispatch::Http::UploadedFile"
      @image = Image.new(image: params[:image])
    else
      @image = Image.new(params[:image])
    end

    respond_to do |format|
      if @image.save
        format.html { redirect_to user_images_path(current_user), notice: 'Image was successfully created.' }
        # format.html { render json: @image, status: :created, location: @image }
        format.json { render :partial => "images/create.json" }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @image = Image.find(params[:id])
  end
  
  def update
    @image = Image.find(params[:id])
    img = Magick::ImageList.new("public" + @image.image.to_s)
    img.crop!(params[:x].to_i, params[:y].to_i, params[:w].to_i, params[:h].to_i).write("public" + @image.image.to_s)
    redirect_to user_images_path
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.delete
    redirect_to user_images_path
  end
end
