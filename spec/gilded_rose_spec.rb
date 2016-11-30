require 'gilded_rose'

describe GildedRose do
  let (:items) { [
    Item.new(name="+5 Dexterity Vest", sell_in=5, quality=3),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=47),
    Item.new(name="Aged Brie", sell_in=5, quality=47),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=5, quality=25),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=47),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=43),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=40),
    # This Conjured item does not work properly yet
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
  ] }

  let(:subject) { GildedRose.new(items) }

  describe "#update_quality" do
    context "when any item ages" do
      it "does not change the name" do
        subject.update_quality
        expect(items[0].name).to eq "+5 Dexterity Vest"
      end
    end

    context "when unexeptional items age([0], [1])" do
      it "reduces quality by 1" do
        expect{ subject.update_quality }.to change{ items[0].quality }.by(-1)
      end

      it "does not decrease quality bellow 0" do
        4.times{ subject.update_quality }
        expect(items[0].quality).to eq 0
      end
    end

    context "when Aged Brie ages([2])" do
      it "increases quality by 1" do
        expect{ subject.update_quality }.to change{ items[2].quality }.by(+1)
      end

      it "does not increase quality over 50" do
        4.times{ subject.update_quality }
        expect(items[2].quality).to eq 50
      end
    end

    context "when Sulfuras ages([3])" do
      it "doesn't change quality" do
        expect{ subject.update_quality }.to change{ items[3].quality }.by(0)
      end
    end

    context "when backstage passes (15 days to concert) age([4])" do
      it "increases quality by 1" do
        expect{ subject.update_quality }.to change{ items[4].quality }.by(+1)
      end

      it "does not increase quality over 50" do
        4.times{ subject.update_quality }
        expect(items[4].quality).to eq 50
      end

      it "sets quality to 0 and doesn't change it after sell by" do
        20.times{ subject.update_quality }
        expect(items[4].quality).to eq 0
      end
    end

    context "when backstage passes (10 days to concert) age([5])" do
      it "increases quality by 2" do
        expect{ subject.update_quality }.to change{ items[5].quality }.by(+2)
      end

      it "does not increase quality over 50" do
        4.times{ subject.update_quality }
        expect(items[5].quality).to eq 50
      end

      it "sets quality to 0 and doesn't change it after sell by" do
        20.times{ subject.update_quality }
        expect(items[5].quality).to eq 0
      end
    end

    context "when backstage passes (15 days to concert) age([4])" do
      it "increases quality by 3" do
        expect{ subject.update_quality }.to change{ items[6].quality }.by(+3)
      end

      it "does not increase quality over 50" do
        4.times{ subject.update_quality }
        expect(items[6].quality).to eq 50
      end

      it "sets quality to 0 and doesn't change it after sell by" do
        20.times{ subject.update_quality }
        expect(items[6].quality).to eq 0
      end
    end

    context "when conjured items age([8])" do
    end
  end

end