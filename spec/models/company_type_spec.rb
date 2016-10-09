require 'rails_helper'

RSpec.describe CompanyType, type: :model do

  context "validations" do
  
	  before(:example) do
	    @type = CompanyType.new(title: "New type of company")
	  end   

	  it "valid with title" do
	  	expect(@type).to be_valid
	  end

	  it "invalid with duplicate title" do
	    @type.save
	    another_type = @type.dup
	    another_type.valid?
	    expect(another_type.errors[:title]).to include("has already been taken")
	  end

	  it "invalid with blank title" do
	    @type.title = "    "
	    @type.valid?
	    expect(@type.errors[:title]).to include("can't be blank")
	  end
	end

	context "associations" do

		it "has many companies" do
		  expect(CompanyType.reflect_on_association(:companies).macro).to eq(:has_many) 
		end	

	end

end
