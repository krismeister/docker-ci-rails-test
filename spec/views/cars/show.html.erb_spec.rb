require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :wheels => "",
      :make => "Make",
      :model => "Model"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
  end
end
