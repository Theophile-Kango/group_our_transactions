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
  scenario 'Create Teacher' do
    expect(page).to have_content('Alexandre')
  end

  scenario 'Edit Teacher' do
    click_link 'Edit Teacher'
    fill_in 'transaction_total', with: 15
    click_button 'Submit'
    expect(page).to have_content('15')
  end

  scenario 'Teachers' do
    visit teachers_path
    expect(page).not_to have_content('Alexandre')
  end

  scenario 'Teachers' do
    visit external_teachers_path
    expect(page).to have_content('Alexandre')
  end
end
