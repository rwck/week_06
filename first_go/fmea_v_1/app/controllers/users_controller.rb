require 'pp'

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def picture=(val)
  #   val = link_to_google_image(val)
  #   write_attribute(:picture, val)
  # end

  # before_save :picture

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = current_user
    if signed_in?
      pp 'user signed in'
    else pp 'USER NOT SIGNED IN'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = set_user
    @projects = @user.projects
    pp @user.firstname
    # pp @projects
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    pp "Params are " + params[:id].to_s
    pp "Current user ID is " + current_user.id.to_s
    if params[:id].to_i == current_user.id
      puts "Yaroo"
    else puts "Baroo"
    end
    # if !current_user.admin && current_user.id != params[:id].to_i
    #   puts "Why isn't this working"
    #   redirect_to :back
    #   # you can put in a , status: 404 here too, if you want but that puts you through to a new page with a clickable link.
    # end
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(user_params)
    # pp 'user picture ' + @user['picture']
    if !@user['picture'].nil? && @user['picture'] != '' && @user['picture'].starts_with?('https://drive.google.com/open?id=')
      @user['picture'] = link_to_google_image(@user['picture'])
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    pp @user
    pp picture_param
    # pp link_to_google_image(picture_param["picture"])
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # @user = User.new(user_params)
    # pp "user picture " + @user["picture"]
    pp @user['picture']
    if !@user['picture'].nil? && @user['picture'] != '' && @user['picture'].starts_with?('https://drive.google.com/open?id=')
      @user['picture'] = link_to_google_image(@user['picture'])
    end
    pp @user.picture

    # if current_user.admin || current_user.id == params[:id].to_i
      pp 'CURREOULKJF LJD FLKJSD FLJ'
      # if params[:id].to_i == current_user.id

      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def link_to_google_image(url)
    string = url.to_s
    string['https://drive.google.com/open?id='] = ''
    string = 'https://drive.google.com/uc?export=download&id=' + string
    string
  end

  def change_picture_string
    self.picture =
      link_to_google_image(picture)
    end

  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    # @user["picture"]
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :picture, :phone)
    end

  def picture_param
    params.require(:user).permit(:picture)
  end
end
