class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_project
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = @user.issues
    @issues.each do |my_issue|
      sev = my_issue.severity_estimate
      detect = my_issue.detection_indicators
      dormancy = my_issue.detection_dormancy_period
      if sev && detect && dormancy
        riskvalue = sev * detect * dormancy
        my_issue.update_column :risk_level, riskvalue
      end
    end
    end

  # @my_variable = @issues.find(1).severity_estimate * @issues.find(1).detection_indicators * @issues.find(1).detection_dormancy_period
  # @issues.find(1).update_column :risk_level, @my_variable
  # # @my_variable.update_column :

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issues = @user.issues
    @issue = set_issue

    # @issues = Issue.all
    @users = User.all
    @projects = Project.all
  end

  # GET /issues/new
  def new
    @issue = @project.issues.build

    #
    # @issue = Issue.new
    # @project_id = params["project_id"]
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params['id'])
  end

  # POST /issues
  # POST /issues.json
  def create
    pp params
    pp @project

    @issue = @project.issues.build(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = @project.issues.find(params[:id]) if @project
  end

  def set_user
    # if params[:user_id]
      # @user = User.find(params[:user_id])
      @user = current_user
      pp "^^^^^^^^^Setting user. It is #{@user.firstname}"
      pp @project
    # end
  end

  def set_project
    if params[:project_id]
      @project =
      Project.find(params[:project_id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:item, :function, :failure, :effect_of_failure, :cause_of_failure, :current_controls, :recommended_actions, :probability_estimate, :severity_estimate, :detection_indicators, :detection_dormancy_period, :risk_level, :further_investigation, :project_id)
  end
end
