require 'test_helper'

class BloodBankInsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blood_bank_insurance = blood_bank_insurances(:one)
  end

  test "should get index" do
    get blood_bank_insurances_url
    assert_response :success
  end

  test "should get new" do
    get new_blood_bank_insurance_url
    assert_response :success
  end

  test "should create blood_bank_insurance" do
    assert_difference('BloodBankInsurance.count') do
      post blood_bank_insurances_url, params: { blood_bank_insurance: { blood_bank_id: @blood_bank_insurance.blood_bank_id, insurance_id: @blood_bank_insurance.insurance_id } }
    end

    assert_redirected_to blood_bank_insurance_url(BloodBankInsurance.last)
  end

  test "should show blood_bank_insurance" do
    get blood_bank_insurance_url(@blood_bank_insurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_blood_bank_insurance_url(@blood_bank_insurance)
    assert_response :success
  end

  test "should update blood_bank_insurance" do
    patch blood_bank_insurance_url(@blood_bank_insurance), params: { blood_bank_insurance: { blood_bank_id: @blood_bank_insurance.blood_bank_id, insurance_id: @blood_bank_insurance.insurance_id } }
    assert_redirected_to blood_bank_insurance_url(@blood_bank_insurance)
  end

  test "should destroy blood_bank_insurance" do
    assert_difference('BloodBankInsurance.count', -1) do
      delete blood_bank_insurance_url(@blood_bank_insurance)
    end

    assert_redirected_to blood_bank_insurances_url
  end
end
