require 'rails_helper'

RSpec.describe "merhants index" do
  it "retrieves a list of merchants" do
    ### User Story - Merchants
      # As a visitor,
      # When I visit '/merchants'
      # I should see a list of merchants by name
      

      visit merchants_path
      expect(page).to have_content('Merchants')
      expect(page).to have_content('Schroeder-Jerde')
      
      # and when I click the merchant's name
      # I should be on page '/merchants/:id'
      click_on 'Schroeder-Jerde'
      expect(current_path).to eq('/merchants/1')
      expect(page).to have_content('Schroeder-Jerde')

      # And I should see a list of items that merchant sells.
      expect(page).to have_content('Item')
  end
end

