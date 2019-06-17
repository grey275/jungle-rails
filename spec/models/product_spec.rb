require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      elves = Category.new(name: 'elves')
      product = Product.new(name: 'Elf on a shelf', price: 10, quantity: 3, category: elves)
      expect(product).to be_valid
    end

    it 'not valid without name' do
      product = Product.new(name: nil)
      expect(product).to_not be_valid
    end

    it 'not valid without price' do
      product = Product.new(price: nil)
      expect(product).to_not be_valid
    end
    it 'not valid without quantity' do
      product = Product.new(quantity: nil)
      expect(product).to_not be_valid
    end
    it 'not valid without category' do
      product = Product.new(category: nil)
      expect(product).to_not be_valid
    end
  end
end
