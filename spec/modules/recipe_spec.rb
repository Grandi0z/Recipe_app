require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { TestConfiguration.create_example_user }
  let(:valid_recipe) do
    create(:recipe, name: 'Pizza', preparation_time: 30, cooking_time: 15,
                    description: 'Make the dough, add toppings, bake in oven.', user:)
  end

  describe 'Validations' do
    it 'Name should be present and have a length between 2 and 250 characters' do
      expect(build(:recipe, name: '', user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, name: 'A' * 251, user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Preparation time should be an integer greater than or equal to zero' do
      expect(build(:recipe, preparation_time: -1, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, preparation_time: 0, user_id: user.id, public: true)).to be_valid
      expect(build(:recipe, preparation_time: 1.5, user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Cooking time should be an integer greater than or equal to zero' do
      expect(build(:recipe, cooking_time: -1, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, cooking_time: 0, user_id: user.id, public: true)).to be_valid
      expect(build(:recipe, cooking_time: 1.5, user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Description should be present' do
      expect(build(:recipe, description: '', user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'User_id should be present' do
      expect(build(:recipe, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
    it { should have_many(:foods).through(:recipe_foods) }
  end
end
