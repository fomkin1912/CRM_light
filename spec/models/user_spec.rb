require 'rails_helper'

RSpec.describe User, type: :model do

  it "valid with name, last_name, email, admin, enabled and group_id" do
    user = User.new(name: "foo",
                    last_name: "bar",
                    mid_name: "foobar",
                    email: "examle@example.com",
                    admin: false,
                    enabled: false,
                    group_id: 1)
    expect(user).to be_valid
  end

  it "invalid without name" do
    user = User.new(name: "")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "invalid without last_name" do
    user = User.new(last_name: "")
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end 

  it "invalid without email" do
  	user = User.new(email: "")
  	user.valid?
  	expect(user.errors[:email]).to include("can't be blank")
  end

  it "invalid without mid_name" do
    user = User.new(mid_name: nil)
    user.valid?
    expect(user.errors[:mid_name]).to include("can't be blank")
  end 
  
  it "invalid without enabled" do
    user = User.new(enabled: nil)
    user.valid?
    expect(user.errors[:enabled]).to include("is not included in the list")
  end

  it "invalid without admin" do
    user = User.new(admin: nil)
    user.valid?
    expect(user.errors[:admin]).to include("is not included in the list")
  end

  it "invalid without group_id" do
  	user = User.new(group_id: nil)
  	user.valid?
  	expect(user.errors[:group_id]).to include("can't be blank")
  end

  it "valid with all attr and have unique email" do
  	User.create(       name: "John",
  		               last_name: "Smith",
  		               mid_name: "foobar",
  		               email: "exp@exp.com",
  		               admin: false,
  		               enabled: true,
  		               group_id: 1)
    user = User.new(name: "Michel",
  		               last_name: "Smith",
  		               mid_name: "barfoo",
  		               email: "exp@exp.com",
  		               admin: false,
  		               enabled: true,
  		               group_id: 1)
  	user.valid?
    expect(user.errors[:email]).to include("has already been taken")   
  end

end
