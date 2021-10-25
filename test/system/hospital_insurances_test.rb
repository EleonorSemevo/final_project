require "application_system_test_case"

class HospitalInsurancesTest < ApplicationSystemTestCase
  setup do
    @hospital_insurance = hospital_insurances(:one)
  end

  test "visiting the index" do
    visit hospital_insurances_url
    assert_selector "h1", text: "Hospital Insurances"
  end

  test "creating a Hospital insurance" do
    visit hospital_insurances_url
    click_on "New Hospital Insurance"

    fill_in "Hospital", with: @hospital_insurance.hospital_id
    fill_in "Insurance", with: @hospital_insurance.insurance_id
    click_on "Create Hospital insurance"

    assert_text "Hospital insurance was successfully created"
    click_on "Back"
  end

  test "updating a Hospital insurance" do
    visit hospital_insurances_url
    click_on "Edit", match: :first

    fill_in "Hospital", with: @hospital_insurance.hospital_id
    fill_in "Insurance", with: @hospital_insurance.insurance_id
    click_on "Update Hospital insurance"

    assert_text "Hospital insurance was successfully updated"
    click_on "Back"
  end

  test "destroying a Hospital insurance" do
    visit hospital_insurances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hospital insurance was successfully destroyed"
  end
end
