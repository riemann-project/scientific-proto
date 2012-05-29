class ProblemsController < ApplicationController
  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])
    @answer = current_user.answers.build(problem_id: @problem.id)

    respond_to do |format|
      format.html { render action: :show }
      format.json { render json: @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = Problem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = current_user.problems.build(params[:problem])

    respond_to do |format|
      if @problem.save
        @log = current_user.logs.build(loggable_type: "Problem", loggable_id: @problem.id, action: "create")
        @log.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])
    @log = current_user.logs.build(loggable_type: "Problem", loggable_id: params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        @log.save
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end
  
  def tag
    @problems = Problem.tagged_with(params[:tag_name])
    
    render action: :index
  end
end
