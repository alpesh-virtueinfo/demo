class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  # GET /users list action
  def index
    @search_fields = ['first_name', 'last_name', 'email']
    @users = get_records(params[:user], params[:page])
  end
  
  #search user
  def user_search_box
    @users = params[:model].constantize.new
    @params_arr = params[:pm].split(',')
  end
  
  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(params[:user].permit!)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully Added.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        render action: 'new'
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path}
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit!
    end
    
    def get_records(search, page)
      user_query = User.all.search(search)
      user_query.order(sort_column + " " + sort_direction).paginate(:per_page => 2, :page => page)
    end    

    def set_header_menu_active
      @users = true
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end	 
  	  
end
