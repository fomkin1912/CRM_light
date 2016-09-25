class Admin::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @user = User.new
  #  @address = @user.build_address

  end

  def create
     super
     byebug
     @user.create_address if @user.id
  end

  def edit
  	super
  end

end