class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = @user.projects
    @users = User.all

    @users.each do |u_name|
      puts "Users name is #{u_name.firstname} #{u_name.lastname} "
      puts @users

    end

    @projects.each do |proj|
      puts 'Project name is ' + proj.name
      puts 'Project user ID ' +
        proj.user_id.to_s

      # @user_name = @users.where("id == #{proj.user_id}")
      # puts "User name is " + @user_name.name.to_s
      @user_name = @users.find(proj.user_id).firstname + " " + @users.find(proj.user_id).lastname
      puts "Blob" + @user_name.to_s
      puts "@user_name is " + @user_name.to_s

    end


    @users.each do |blob|
      puts "User ID is #{blob.id}"
      # "&&&&&& Blob is: #{blob.id}"
    end

    # @test_projects = Project.find(1).id
    @projects.each do |proj|
      puts 'Project name is ' + proj.name
      puts 'Project user ID ' +
        proj.user_id.to_s

      # @user_name = @users.where("id == #{proj.user_id}")
      # puts "User name is " + @user_name.name.to_s
      # @user_name = @users.find(proj.user_id).firstname + " " + @users.find(proj.user_id).lastname
      # puts "Blob" + @user_name.to_s
      # puts "@user_name is " + @user_name.to_s


    end

    @all_users = User.all

    @all_users.each do |u_name|
      puts "Users name is #{u_name.firstname} #{u_name.lastname} "
      puts

      # puts @all_users
    end

    # @user = Project.user_id
    # puts "User " + @user

    puts ' *** Projects are projects ' + @projects.to_s

    # pp "test Projects" + @test_projects.to_s
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    # @project = @user.projects.find(params[:id])
    # @project = set_project



    # @project_list = Issue.find_by project_id: @project
    # Issue.find_each do |issue|
    #   pp issue[:item]
    # end

    # pp @project_list[:item]
  end

  # GET /projects/new
  def new
    # @project = Project.new
    @users = User.all
    @project = @user.projects.build

  end

  # GET /projects/1/edit
  def edit
    @users = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    # @issue = @project.issues.build(issue_params)
    @project = @user.projects.build(project_params)
    # the @user bit above ensures that the new project will be owned by the user. You don't need to pass the user id around beyond what that bit does for you anyway.
    # pp "*****" + project_params.to_s


    # @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    # @project = @user.projects.find(params[:user_id]) if @project
    @project = @user.projects.find(params[:id])

  end


  def set_user
    # if params[:user_id]
      # @user = User.find(params[:user_id])
      @user = current_user
      pp "^^^^^^^^^Setting user. It is #{@user.firstname}"
      pp @project
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name)
    # , :user_id)
  end
end
