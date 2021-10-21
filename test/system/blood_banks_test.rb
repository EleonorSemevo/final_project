require "application_system_test_case"

class BloodBanksTest < ApplicationSystemTestCase
  setup do
    @blood_bank = blood_banks(:one)
  end

  test "visiting the index" do
    visit blood_banks_url
    assert_selector "h1", text: "Blood Banks"
  end

  test "creating a Blood bank" do
    visit blood_banks_url
    click_on "New Blood Bank"

    fill_in "Area", with: @blood_bank.area_id
    fill_in "Googlemap link", with: @blood_bank.googlemap_link
    fill_in "Name", with: @blood_bank.name
    fill_in "Number1", with: @blood_bank.number1
    fill_in "Number2", with: @blood_bank.number2
    click_on "Create Blood bank"

    assert_text "Blood bank was successfully created"
    click_on "Back"
  end

  test "updating a Blood bank" do
    visit blood_banks_url
    click_on "Edit", match: :first

    fill_in "Area", with: @blood_bank.area_id
    fill_in "Googlemap link", with: @blood_bank.googlemap_link
    fill_in "Name", with: @blood_bank.name
    fill_in "Number1", with: @blood_bank.number1
    fill_in "Number2", with: @blood_bank.number2
    click_on "Update Blood bank"

    assert_text "Blood bank was successfully updated"
    click_on "Back"
  end

  test "destroying a Blood bank" do
    visit blood_banks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blood bank was successfully destroyed"
  end
end
