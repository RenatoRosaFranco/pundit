require 'rails_helper'

RSpec.describe "dashboard/tasks/edit", type: :view do
  before(:each) do
    @dashboard_task = assign(:dashboard_task, Dashboard::Task.create!(
      :name => "MyString",
      :description => "MyText",
      :status => false,
      :tags => "MyString"
    ))
  end

  it "renders the edit dashboard_task form" do
    render

    assert_select "form[action=?][method=?]", dashboard_task_path(@dashboard_task), "post" do

      assert_select "input[name=?]", "dashboard_task[name]"

      assert_select "textarea[name=?]", "dashboard_task[description]"

      assert_select "input[name=?]", "dashboard_task[status]"

      assert_select "input[name=?]", "dashboard_task[tags]"
    end
  end
end
