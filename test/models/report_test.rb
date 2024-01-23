# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    alice =  users(:alice)
    bob = users(:bob)
    report = user.reports.create!(title: 'title', content: 'content')

    assert(report.user == alice)
    assert_not(report.user == bob)
  end

  test 'created_on' do
    user = users(:alice)
    report = user.reports.create!(title: 'title', content: 'content')

    assert(report.created_on == user.created_at.strftime('%a, %d %b %Y').to_date)
  end
end
