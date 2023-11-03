require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { TestConfiguration.create_example_user }
  let(:valid_food) { create(:food, name: 'Tomato', measurement_unit: 'kg', price: 2.5, quantity: 10, user:) }

  describe 'Validations' do
    it 'Name should be present and have a length between 2 and 250 characters' do
      expect(build(:food, name: '', user_id: user.id)).not_to be_valid
      expect(build(:food, name: 'A' * 251, user_id: user.id)).not_to be_valid
      expect(valid_food).to be_valid
    end

    it 'Measurement unit should be present and have a length between 2 and 250 characters' do
      expect(build(:food, measurement_unit: '', user_id: user.id)).not_to be_valid
      expect(build(:food, measurement_unit: 'A' * 251, user_id: user.id)).not_to be_valid
      expect(valid_food).to be_valid
    end

    it 'Price should be a decimal number greater than or equal to zero' do
      expect(build(:food, price: -1, user_id: user.id)).not_to be_valid
      expect(build(:food, price: 0, user_id: user.id)).to be_valid
      expect(build(:food, price: 'a', user_id: user.id)).not_to be_valid
      expect(valid_food).to be_valid
    end

    it 'Quantity should be a decimal number greater than or equal to zero' do
      expect(build(:food, quantity: -1, user_id: user.id)).not_to be_valid
      expect(build(:food, quantity: 0, user_id: user.id)).to be_valid
      expect(build(:food, quantity: 'a', user_id: user.id)).not_to be_valid
      expect(valid_food).to be_valid
    end

    it 'User_id should be present' do
      expect(build(:food)).not_to be_valid
      expect(valid_food).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
    it { should have_many(:recipes).through(:recipe_foods) }
  end
end
