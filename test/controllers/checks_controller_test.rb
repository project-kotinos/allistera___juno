require 'test_helper'

class ChecksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @check = checks(:one)
    sign_in users(:joe)
  end

  test 'should be authenticated' do
    sign_out :user

    get checks_url
    assert_redirected_to new_user_session_url
  end

  test 'should get index' do
    get checks_url
    assert_response :success
  end

  test 'should get new' do
    get new_check_url
    assert_response :success
  end

  test 'should create check' do
    assert_difference('Check.count') do
      post checks_url, params: { check: { site_id: @check.site_id, status: @check.status } }
    end

    assert_redirected_to check_url(Check.last)
  end

  test 'should show check' do
    get check_url(@check)
    assert_response :success
  end

  test 'should get edit' do
    get edit_check_url(@check)
    assert_response :success
  end

  test 'should update check' do
    patch check_url(@check), params: { check: { site_id: @check.site_id, status: @check.status } }
    assert_redirected_to check_url(@check)
  end

  test 'should destroy check' do
    assert_difference('Check.count', -1) do
      delete check_url(@check)
    end

    assert_redirected_to checks_url
  end
end