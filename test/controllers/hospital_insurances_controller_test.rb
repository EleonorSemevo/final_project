require 'test_helper'

class HospitalInsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_insurance = hospital_insurances(:one)
  end

  test "should get index" do
    get hospital_insurances_url
    assert_response :success
  end

  test "should get new" do
    get new_hospital_insurance_url
    assert_response :success
  end

  test "should create hospital_insurance" do
    assert_difference('HospitalInsurance.count') do
      post hospital_insurances_url, params: { hospital_insurance: { hospital_id: @hospital_insurance.hospital_id, insurance_id: @hospital_insurance.insurance_id } }
    end

    assert_redirected_to hospital_insurance_url(HospitalInsurance.last)
  end

  test "should show hospital_insurance" do
    get hospital_insurance_url(@hospital_insurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospital_insurance_url(@hospital_insurance)
    assert_response :success
  end

  test "should update hospital_insurance" do
    patch hospital_insurance_url(@hospital_insurance), params: { hospital_insurance: { hospital_id: @hospital_insurance.hospital_id, insurance_id: @hospital_insurance.insurance_id } }
    assert_redirected_to hospital_insurance_url(@hospital_insurance)
  end

  test "should destroy hospital_insurance" do
    assert_difference('HospitalInsurance.count', -1) do
      delete hospital_insurance_url(@hospital_insurance)
    end

    assert_redirected_to hospital_insurances_url
  end
end
