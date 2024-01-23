# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:first_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: '初めまして'
    fill_in '内容', with: 'よろしくお願いします。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '初めまして'
    assert_text 'よろしくお願いします。'
    click_on '日報の一覧に戻る'
  end

  test 'should update Report' do
    visit report_url(@report)
    click_on 'この日報を編集'

    fill_in 'タイトル', with: '初めて投稿します'
    fill_in '内容', with: 'よろしくお願いします'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '初めて投稿します'
    assert_text 'よろしくお願いします'
    click_on '日報の一覧に戻る'
  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_on 'この日報を削除'

    assert_text '日報が削除されました。'
  end
end
