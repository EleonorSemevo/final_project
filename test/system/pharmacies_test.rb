require "application_system_test_case"

class PharmaciesTest < ApplicationSystemTestCase
  setup do
    @pharmacy = pharmacies(:one)
  end

  test "visiting the index" do
    visit pharmacies_url
    assert_selector "h1", text: "Pharmacies"
  end

  test "creating a Pharmacy" do
    visit pharmacies_url
    click_on "New Pharmacy"

    check "All nigth" if @pharmacy.all_nigth
    fill_in "Area", with: @pharmacy.area_id
    fill_in "Googlemap link", with: @pharmacy.googlemap_link
    fill_in "Name", with: @pharmacy.name
    fill_in "Number1", with: @pharmacy.number1
    fill_in "Number2", with: @pharmacy.number2
    click_on "Create Pharmacy"

    assert_text "Pharmacy was successfully created"
    click_on "Back"
  end

  test "updating a Pharmacy" do
    visit pharmacies_url
    click_on "Edit", match: :first

    check "All nigth" if @pharmacy.all_nigth
    fill_in "Area", with: @pharmacy.area_id
    fill_in "Googlemap link", with: @pharmacy.googlemap_link
    fill_in "Name", with: @pharmacy.name
    fill_in "Number1", with: @pharmacy.number1
    fill_in "Number2", with: @pharmacy.number2
    click_on "Update Pharmacy"

    assert_text "Pharmacy was successfully updated"
    click_on "Back"
  end

  test "destroying a Pharmacy" do
    visit pharmacies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pharmacy was successfully destroyed"
  end
end
