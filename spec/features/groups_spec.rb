require 'rails_helper'

RSpec.describe 'transaction pages', type: :feature do
  before(:each) do
    User.create(name: 'Rugobert')
    visit login_path
    fill_in 'name', with: 'Rugobert'
    click_on 'Log in'
    expect(page).to have_content('Rugobert')
  end

  before(:each) do
    visit teachers_path
    click_link 'Add Teacher'
    fill_in 'transaction_name', with: 'Alexandre'
    fill_in 'transaction_total', with: 20
    click_button 'Submit'
  end

  before(:each) do
    visit courses_path
    click_link 'Create New Course'
    fill_in 'group_name', with: 'Mathematic'
    page.attach_file('group_icon', Rails.root + 'app/assets/images/avatar.png')
    click_button 'Submit'
  end

  scenario 'Create Course with invalid field' do
    visit courses_path
    click_link 'Create New Course'
    fill_in 'group_name', with: 'English'
    click_button 'Submit'
    expect(page).to have_content("Icon can't be blank")
  end

  scenario 'Create Course' do
    expect(page).to have_content('Mathematic')
    expect(page).to have_content('Alexandre')
  end

  scenario 'Teacher is visible in external teachers' do
    visit external_teachers_path
    expect(page).to have_content('Alexandre')
  end

  scenario 'Attribute a course to teacher' do
    click_button 'Add'
    visit teachers_path
    expect(page).to have_content('Alexandre')
  end

  scenario 'Teacher is not visible in external teachers' do
    click_button 'Add'
    visit external_teachers_path
    expect(page).not_to have_content('Alexandre')
  end
  #   User.create(name: 'Rugobert')
  #   visit login_path
  #   fill_in 'name', with: 'Rugobert'
  #   click_on 'Log in'
  #   expect(page).to have_content('Rugobert')
  scenario "The user who didn't create the course can't edit it" do
    User.create(name: 'Roddrigue')
    visit login_path
    fill_in 'name', with: 'Roddrigue'
    click_on 'Log in'
    visit courses_path
    click_link 'Mathematic'
    expect(page).not_to have_content('Edit Course')
  end

  scenario 'The user who created the course can edit it' do
    visit courses_path
    click_link 'Mathematic'
    click_link 'Edit Course'
    fill_in 'group_name', with: 'Algebra'
    click_button 'Submit'
    expect(page).to have_content('Course: Algebra')
  end
end
