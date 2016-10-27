require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validate' do
    it 'valid addressable_id and addressable type' do
	    address = Address.new(addressable_id: 5, addressable_type: 'user')
      expect(address).to be_valid
    end
# Don't know how to make presende validation of association
#  	it 'invalid without addressable_type' do
#	  	address = Address.new(addressable_id: 5, addressable_type: nil)
#	  	address.valid?
# 		expect(address.errors[:addressable_type]).to include('can't be blank')
#  	end
#  	it 'invalid without addressable_id' do
#  	  address = Address.new(addressable_id: nil, addressable_type: 'user')#
#	  	address.valid?
#  		expect(address.errors[:addressable_id]).to include('can't be blank')
#  	end
  end
end
