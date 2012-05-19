class ProblemImagesController < ApplicationController
  require "rmagick"
  include Magick
  
  def index
    @images = current_user.problem_images
  end
  
  def new
    @image = Problem.find(params[:problem_id]).problem_images.build
  end
  
  def create
    @image = Problem.find(params[:problem_id]).problem_images.build(params[:problem_image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to edit_problem_problem_image_path(@image.problem, @image), notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @image = ProblemImage.find(params[:id])
  end
  
  def update
    @image = ProblemImage.find(params[:id])
    img = ImageList.new("public" + @image.image.to_s)
    img.crop!(params[:x].to_i, params[:y].to_i, params[:w].to_i, params[:h].to_i).write("public" + @image.image.to_s)
    redirect_to @image.problem
  end
  
  def destroy
    @image = ProblemImage.find(params[:id])
    @image.delete
    redirect_to @image.problem
  end
end
