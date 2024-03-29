class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.find_all_by_discussable_id_and_discussable_type(params[:answer_id], "Answer")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])
    @new_discussion = @discussion.discussions.build
    
    @discussion.discussions.pop

    respond_to do |format|
      format.html { render action: :show}
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = Answer.find(params[:answer_id]).discussions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end
  
  def reply
    @discussion = Discussion.find(params[:id]).discussions.build

    respond_to do |format|
      format.html { render action: "new" }
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = current_user.discussions.build(params[:discussion])
    @discussion.discussable_type = "Answer"
    @discussion.discussable_id = params[:answer_id]
    

    respond_to do |format|
      if @discussion.save
        @log = current_user.logs.create(loggable_type: "Discussion", loggable_id: @discussion.id, action: "create")
        format.html { redirect_to [@discussion.problem, @discussion.super_answer, @discussion.super_discussion], notice: 'Discussion was successfully created.' }
        format.json { render json: [@discussion.problem, @discussion.super_answer, @discussion.super_discussion], status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_reply
    @discussion = Discussion.find(params[:id]).discussions
    .build(params[:discussion].merge(user_id: current_user.id))

    respond_to do |format|
      if @discussion.save
        @log = current_user.logs.build(loggable_type: "Discussion", loggable_id: @discussion.id, action: "create")
        format.html { redirect_to [@discussion.problem, @discussion.super_answer, @discussion.super_discussion], notice: 'Discussion was successfully created.' }
        format.json { render json: [@discussion.problem, @discussion.super_answerr, @discussion.super_discussion], status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        @log = current_user.logs.build(loggable_type: "Discussion", loggable_id: @discussion.id, action: "update")
        format.html { redirect_to [@discussion.problem, @discussion.super_answer, @discussion.super_discussion], notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to problem_answer_discussions_url(@discussion.problem, @discussion.super_answer) }
      format.json { head :no_content }
    end
  end
end
