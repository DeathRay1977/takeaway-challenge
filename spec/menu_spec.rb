require 'menu'

describe Menu do
  let(:description) {"Cheeseburger"}
  let(:price) {4.99}
  let(:burger) {double :dish, :description => description, :price => price}
  subject(:menu) {described_class.new}

  context 'Menu Items' do
    it {is_expected.to respond_to(:dishes)}

    it 'Starts with an empty menu' do
      expect(menu.dishes).to be_empty
    end
  end

  context 'Adding Dishes' do
    it {is_expected.to respond_to(:add).with(1).argument}

    it 'adds a dish to the menu' do
      menu.add(burger)
      expect(menu.dishes).not_to be_empty
    end
  end
  context 'Choosing a dish' do
    it {is_expected.to respond_to(:choose).with(1).argument}

    it 'selects a dish by its description' do
      menu.add(burger)
      expect(menu.choose(description)).to eq burger
    end
  end
end
