require 'rails_helper'

RSpec.describe "dashboard/tasks/show", type: :view do
  before(:each) do
    @dashboard_task = assign(:dashboard_task, Dashboard::Task.create!(
      :name => "Name",
      :description => "MyText",
      :status => false,
      :tags => "Tags"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Tags/)
  end
end
