require 'rails_helper'

RSpec.describe "dashboard/tasks/index", type: :view do
  before(:each) do
    assign(:dashboard_tasks, [
      Dashboard::Task.create!(
        :name => "Name",
        :description => "MyText",
        :status => false,
        :tags => "Tags"
      ),
      Dashboard::Task.create!(
        :name => "Name",
        :description => "MyText",
        :status => false,
        :tags => "Tags"
      )
    ])
  end

  it "renders a list of dashboard/tasks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
