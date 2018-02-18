require 'rails_helper'

RSpec.describe "dashboard/tasks/new", type: :view do
  before(:each) do
    assign(:dashboard_task, Dashboard::Task.new(
      :name => "MyString",
      :description => "MyText",
      :status => false,
      :tags => "MyString"
    ))
  end

  it "renders new dashboard_task form" do
    render

    assert_select "form[action=?][method=?]", dashboard_tasks_path, "post" do

      assert_select "input[name=?]", "dashboard_task[name]"

      assert_select "textarea[name=?]", "dashboard_task[description]"

      assert_select "input[name=?]", "dashboard_task[status]"

      assert_select "input[name=?]", "dashboard_task[tags]"
    end
  end
end
