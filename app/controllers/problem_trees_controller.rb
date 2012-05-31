class ProblemTreesController < ApplicationController
  def index
    render text: "this is ProblemTrees#index"
  end
  
  def new
    @problem_tree = ProblemTree.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_tree }
    end
  end
  
  def create
    @problem_tree = ProblemTree.new(params[:problem_tree])
    
    respond_to do |format|
      if @problem_tree.save
        format.html { render action: "index"}
        format.json { render json: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end
end