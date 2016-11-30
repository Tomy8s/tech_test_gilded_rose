require 'gilded_rose'

describe GildedRose do
  let(:vest) { Item.new(name="+5 Dexterity Vest", sell_in=15, quality=25) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=15, quality=25) }
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=15, quality=25) }
  let(:sulfanas) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=15, quality=25) }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end