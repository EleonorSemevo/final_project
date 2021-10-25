require "application_system_test_case"

class PharmacyInsurancesTest < ApplicationSystemTestCase
  setup do
    @pharmacy_insurance = pharmacy_insurances(:one)
  end

  test "visiting the index" do
    visit pharmacy_insurances_url
    assert_selector "h1", text: "Pharmacy Insurances"
  end

  test "creating a Pharmacy insurance" do
    visit pharmacy_insurances_url
    click_on "New Pharmacy Insurance"

    fill_in "Insurance", with: @pharmacy_insurance.insurance_id
    fill_in "Pharmacy", with: @pharmacy_insurance.pharmacy_id
    click_on "Create Pharmacy insurance"

    assert_text "Pharmacy insurance was successfully created"
    click_on "Back"
  end

  test "updating a Pharmacy insurance" do
    visit pharmacy_insurances_url
    click_on "Edit", match: :first

    fill_in "Insurance", with: @pharmacy_insurance.insurance_id
    fill_in "Pharmacy", with: @pharmacy_insurance.pharmacy_id
    click_on "Update Pharmacy insurance"

    assert_text "Pharmacy insurance was successfully updated"
    click_on "Back"
  end

  test "destroying a Pharmacy insurance" do
    visit pharmacy_insurances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pharmacy insurance was successfully destroyed"
  end
end
