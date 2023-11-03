require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...', user:) }

  describe 'GET Recipe#index' do
    let(:user) { TestConfiguration.create_example_user }
    before do
      sign_in user
      get user_recipes_path(user)
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/index' do
      expect(response).to render_template('recipes/index')
    end

    it 'Body shlud include recipe name' do
      get user_recipes_path(user)
      expect(response.body).to include('Recipes'.to_s)
    end
  end

  describe 'GET Recipe#new' do
    before do
      sign_in user
      get new_user_recipe_path(user)
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/new' do
      expect(response).to render_template('recipes/new')
    end

    it 'Body shlud include recipe information' do
      expect(response.body).to include('Create recipe')
    end
  end

  describe 'GET Recipe#show' do
    before do
      sign_in user
      get user_recipe_path(user, recipe)
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/show' do
      expect(response).to render_template('recipes/show')
    end

    it 'Body shlud include recipe information' do
      expect(response.body).to include(recipe.name)
    end
  end
end
