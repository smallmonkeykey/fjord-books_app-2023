# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  # test 'visiting the index' do
  #   visit reports_url
  #   assert_selector 'h1', text: 'Reports'
  # end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '日報の一覧に戻る'
  end

  # test 'should update Report' do
  #   visit report_url(@report)
  #   click_on 'Edit this report', match: :first

  #   fill_in 'Content', with: @report.content
  #   fill_in 'Title', with: @report.title
  #   fill_in 'User', with: @report.user_id
  #   click_on 'Update Report'

  #   assert_text 'Report was successfully updated'
  #   click_on 'Back'
  # end

  # test 'should destroy Report' do
  #   visit report_url(@report)
  #   click_on 'Destroy this report', match: :first

  #   assert_text 'Report was successfully destroyed'
  # end
end
