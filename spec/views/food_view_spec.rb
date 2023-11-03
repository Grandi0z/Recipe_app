require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { TestConfiguration.create_example_user }

  before do
    visit user_foods_path(user)
  end

  it "renders user's foods list" do
    expect(page).to have_content('Foods')
  end

  it 'renders a table with food details' do
    expect(page).to have_selector('table')
    expect(page).to have_selector('th', text: 'No')
    expect(page).to have_selector('th', text: 'Food')
    expect(page).to have_selector('th', text: 'Measurement unit')
    expect(page).to have_selector('th', text: 'Unit price')
    expect(page).to have_selector('th', text: 'Quantity')
    expect(page).to have_selector('th', text: 'Action')
    expect(page).to have_selector('td', text: '1')
    expect(page).to have_selector('td', text: 'Banana')
    expect(page).to have_selector('td', text: 'unit')
    expect(page).to have_selector('td', text: '1.0$')
    expect(page).to have_selector('td', text: '1')
  end

  it 'renders Add New Food button' do
    expect(page).to have_css('a', text: 'Add food')
  end
end
