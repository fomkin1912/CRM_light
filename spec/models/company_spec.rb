require 'rails_helper'

RSpec.describe Company, type: :model do
  
  describe "validations" do

  	before(:example) { @company = Company.new(title: "New company", company_type_id: 5) }
  	
  	it "valid with title and company_type_id" do
  		expect(@company).to be_valid
  	end

  	it "invalid without title" do
  		@company.title = "  "
  		@company.valid?
  		expect(@company.errors[:title]).to include("can't be blank")
  	end

  	it "invalid without company_type_id" do
  		@company.company_type_id = nil
  		@company.valid?
  		expect(@company.errors[:company_type_id]).to include("can't be blank")
  	end

  	it "have unique title" do
  		@company.save
  		other = @company.dup
  		other.valid?
  		expect(other.errors[:title]).to include ("has already been taken")
  	end
  end

  describe "associations" do

  	it "belongs_to company_type" do
  		expect(Company.reflect_on_association(:company_type).macro).to eq(:belongs_to)
  	end

  	it "has_many contacts" do
  		expect(Company.reflect_on_association(:contacts).macro).to eq(:has_many)
  	end
  end	
end