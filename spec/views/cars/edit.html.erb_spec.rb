require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :wheels => "",
      :make => "MyString",
      :model => "MyString"
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_wheels[name=?]", "car[wheels]"

      assert_select "input#car_make[name=?]", "car[make]"

      assert_select "input#car_model[name=?]", "car[model]"
    end
  end
end
