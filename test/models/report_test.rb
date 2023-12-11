# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    user = User.create!(email: 'a@example.com', password: 'password')
    user2 = User.create!(email: 'b@example.com', password: 'password')
    report = user.reports.create!(title: 'title', content: 'content')

    assert (report.user == user )
    assert_not (report.user == user2)
  end
  
  test "created_on" do
    user = User.create!(email: 'a@example.com', password: 'password')
    report = user.reports.create!(title: 'title', content: 'content')
    
    assert (report.created_on == user.created_at.strftime('%a, %d %b %Y').to_date)
  end
end
