require 'test_helper'

class BloodBanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blood_bank = blood_banks(:one)
  end

  test "should get index" do
    get blood_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_blood_bank_url
    assert_response :success
  end

  test "should create blood_bank" do
    assert_difference('BloodBank.count') do
      post blood_banks_url, params: { blood_bank: { area_id: @blood_bank.area_id, googlemap_link: @blood_bank.googlemap_link, name: @blood_bank.name, number1: @blood_bank.number1, number2: @blood_bank.number2 } }
    end

    assert_redirected_to blood_bank_url(BloodBank.last)
  end

  test "should show blood_bank" do
    get blood_bank_url(@blood_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_blood_bank_url(@blood_bank)
    assert_response :success
  end

  test "should update blood_bank" do
    patch blood_bank_url(@blood_bank), params: { blood_bank: { area_id: @blood_bank.area_id, googlemap_link: @blood_bank.googlemap_link, name: @blood_bank.name, number1: @blood_bank.number1, number2: @blood_bank.number2 } }
    assert_redirected_to blood_bank_url(@blood_bank)
  end

  test "should destroy blood_bank" do
    assert_difference('BloodBank.count', -1) do
      delete blood_bank_url(@blood_bank)
    end

    assert_redirected_to blood_banks_url
  end
end
