require 'rails_helper'

RSpec.describe 'recipes/index', type: :feature do
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) { create(:recipe, name: 'Banana Cake', description: 'A delicious and moist cake made with bananas.') }
  before do
    visit user_recipes_path(user)
    @recipes = Recipe.all
  end

  it "renders user's recipes list" do
    expect(page).to have_content('Recipes')
  end

  it 'renders Create recipe button' do
    expect(page).to have_css('a', text: 'Create recipe')
  end
end
