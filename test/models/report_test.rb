# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    alice = users(:alice)
    bob = users(:bob)
    report = alice.reports.create!(title: 'title', content: 'content')

    assert(report.editable?(alice))
    assert_not(report.editable?(bob))
  end

  test 'created_on' do
    user = users(:alice)
    report = user.reports.create!(title: 'title', content: 'content')

    assert_equal(report.created_on, user.created_at.to_date)
  end
end
