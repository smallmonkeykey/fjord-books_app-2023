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
    click_on '日報'
    assert_selector 'h1', text: '日報の一覧'
    click_on '日報の新規作成'

    fill_in 'タイトル', with: '初めまして'
    fill_in '内容', with: 'よろしくお願いします。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '初めまして'
    assert_text 'よろしくお願いします。'
  end

  test 'should update Report' do
    click_on '日報'
    assert_selector 'h1', text: '日報の一覧'
    click_link 'この日報を表示', href: report_path(@report)
    assert_selector 'h1', text: '日報の詳細'
    assert_text '初めての日報'
    click_on 'この日報を編集'

    fill_in 'タイトル', with: '初めて投稿します'
    fill_in '内容', with: 'よろしくお願いします'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '初めて投稿します'
    assert_text 'よろしくお願いします'
  end

  test 'should destroy Report' do
    assert Report.find_by(id: @report.id).present?
    visit report_url(@report)
    click_on 'この日報を削除'

    assert_text '日報が削除されました。'
    assert_not Report.find_by(id: @report.id).present?
  end
end
