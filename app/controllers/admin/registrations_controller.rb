class Admin::RegistrationsController < Devise::RegistrationsController

  def index
    @users = User.all
    render :index
  end

  def new
    super
    @user = User.new
  #  @address = @user.build_address

  end

  def create
     super
     @user.create_address if @user.id
  end

  def edit
  	super
  end



end