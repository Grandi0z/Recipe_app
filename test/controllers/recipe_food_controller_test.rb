require 'test_helper'

class RecipeFoodControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recipe_food_index_url
    assert_response :success
  end

  test 'should get show' do
    get recipe_food_show_url
    assert_response :success
  end

  test 'should get new' do
    get recipe_food_new_url
    assert_response :success
  end

  test 'should get create' do
    get recipe_food_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get recipe_food_destroy_url
    assert_response :success
  end
end
