require "application_system_test_case"

class BloodBankInsurancesTest < ApplicationSystemTestCase
  setup do
    @blood_bank_insurance = blood_bank_insurances(:one)
  end

  test "visiting the index" do
    visit blood_bank_insurances_url
    assert_selector "h1", text: "Blood Bank Insurances"
  end

  test "creating a Blood bank insurance" do
    visit blood_bank_insurances_url
    click_on "New Blood Bank Insurance"

    fill_in "Blood bank", with: @blood_bank_insurance.blood_bank_id
    fill_in "Insurance", with: @blood_bank_insurance.insurance_id
    click_on "Create Blood bank insurance"

    assert_text "Blood bank insurance was successfully created"
    click_on "Back"
  end

  test "updating a Blood bank insurance" do
    visit blood_bank_insurances_url
    click_on "Edit", match: :first

    fill_in "Blood bank", with: @blood_bank_insurance.blood_bank_id
    fill_in "Insurance", with: @blood_bank_insurance.insurance_id
    click_on "Update Blood bank insurance"

    assert_text "Blood bank insurance was successfully updated"
    click_on "Back"
  end

  test "destroying a Blood bank insurance" do
    visit blood_bank_insurances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blood bank insurance was successfully destroyed"
  end
end
