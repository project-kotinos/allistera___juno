require 'test_helper'

class SlackSettingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @slack_setting = slack_settings(:one)
    sign_in users(:joe)
  end

  test 'should be authenticated' do
    sign_out :user
    get slack_settings_url
    assert_redirected_to new_user_session_url
  end

  test 'should get index' do
    get slack_settings_url
    assert_response :success
  end

  test 'should get new' do
    get new_slack_setting_url
    assert_response :success
  end

  test 'should create slack_setting' do
    assert_difference('SlackSetting.count') do
      post slack_settings_url, params: {
        slack_setting: {
          channel: @slack_setting.channel,
          project_id: @slack_setting.project_id,
          username: @slack_setting.username,
          webhook_url: @slack_setting.webhook_url
        }
      }
    end

    assert_redirected_to project_url(SlackSetting.last.project)
  end

  test 'should show slack_setting' do
    get slack_setting_url(@slack_setting)
    assert_response :success
  end

  test 'should get edit' do
    get edit_slack_setting_url(@slack_setting)
    assert_response :success
  end

  test 'should update slack_setting' do
    patch slack_setting_url(@slack_setting), params: {
      slack_setting: {
        channel: @slack_setting.channel,
        project_id: @slack_setting.project_id,
        username: @slack_setting.username,
        webhook_url: @slack_setting.webhook_url
      }
    }
    assert_redirected_to project_url(@slack_setting.project)
  end

  test 'should destroy slack_setting' do
    assert_difference('SlackSetting.count', -1) do
      delete slack_setting_url(@slack_setting)
    end

    assert_redirected_to project_url(@slack_setting.project)
  end
end