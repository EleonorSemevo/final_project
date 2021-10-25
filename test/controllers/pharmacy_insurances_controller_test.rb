require 'test_helper'

class PharmacyInsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pharmacy_insurance = pharmacy_insurances(:one)
  end

  test "should get index" do
    get pharmacy_insurances_url
    assert_response :success
  end

  test "should get new" do
    get new_pharmacy_insurance_url
    assert_response :success
  end

  test "should create pharmacy_insurance" do
    assert_difference('PharmacyInsurance.count') do
      post pharmacy_insurances_url, params: { pharmacy_insurance: { insurance_id: @pharmacy_insurance.insurance_id, pharmacy_id: @pharmacy_insurance.pharmacy_id } }
    end

    assert_redirected_to pharmacy_insurance_url(PharmacyInsurance.last)
  end

  test "should show pharmacy_insurance" do
    get pharmacy_insurance_url(@pharmacy_insurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_pharmacy_insurance_url(@pharmacy_insurance)
    assert_response :success
  end

  test "should update pharmacy_insurance" do
    patch pharmacy_insurance_url(@pharmacy_insurance), params: { pharmacy_insurance: { insurance_id: @pharmacy_insurance.insurance_id, pharmacy_id: @pharmacy_insurance.pharmacy_id } }
    assert_redirected_to pharmacy_insurance_url(@pharmacy_insurance)
  end

  test "should destroy pharmacy_insurance" do
    assert_difference('PharmacyInsurance.count', -1) do
      delete pharmacy_insurance_url(@pharmacy_insurance)
    end

    assert_redirected_to pharmacy_insurances_url
  end
end
