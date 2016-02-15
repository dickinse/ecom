require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "Great Hexpectations")
    @user = User.create!(first_name: "Frank", last_name: "Jones", email: "daddy@longlegs.com", password:"87654321")
    @product.comments.create!(rating: 5, user: @user, body: "So many pictures!")
    @product.comments.create!(rating: 1, user: @user, body: "So many pictures.")
    @product.comments.create!(rating: 3, user: @user, body: "So many pictures...")
  end
  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq(3)
  end

  it "Nameless product is not a valid entry" do
    expect(Product.new(description: "PAGES!")).not_to be_valid
  end
end
