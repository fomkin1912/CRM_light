require 'rails_helper'

RSpec.describe ActivityType, type: :model do

  describe 'validations' do
    it 'valid with title' do
      activity_type = ActivityType.new(title: 'New activity_type')
      expect(activity_type).to be_valid
    end

    it 'invalid without title' do
      activity_type = ActivityType.new(title: '')
      activity_type.valid?
      expect(activity_type.errors[:title]).to include("can't be blank")
    end

    it 'have uniq title' do
      other = ActivityType.new(title: 'New activity_type')
      other.valid?
      expect(other.errors[:title]).to include('has already been taken')
    end
    it "can't be changed if title has been taken" do
      other = ActivityType.create(title: 'New activity_type_1')
      other.update(title: 'New activity_type')
      other.valid?
      expect(other.errors[:title]).to include('has already been taken')
    end
  end
end