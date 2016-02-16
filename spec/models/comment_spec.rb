require 'rails_helper'

describe Comments do
  before do
    @product = Product.create!(name: "A tale of Two Shiftys")
    @product.comments.create!(rating: 5, user: @user, body: "So many pictures!")
  end

  it "Is a valid comment" do
    expect (@product).to be_valid
  end

  before do
    @product = Product.create!(name: "A tale of Two Shandies")
    @product.comments.create!(rating: 5, user: @user)
  end

  it "Is a valid comment" do
    expect (@product).not_to be_valid
  end
end
