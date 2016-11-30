class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|



      #increases quality
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.name != "Sulfuras, Hand of Ragnaros"
          reduce_quality_of(item)
        end
      else
        increase_quality_of(item)
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
              increase_quality_of(item)
          end
          if item.sell_in < 6
            increase_quality_of(item)
          end
        end
      end



      #decreases sell_in
      decrease_sell_in_of(item)

      #decreases quality
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.name != "Sulfuras, Hand of Ragnaros"
              reduce_quality_of(item)
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          increase_quality_of(item)
        end
      end
    end
  end


  #new methods
  def reduce_quality_of(item, reduction = 1)
    item.quality -= reduction unless item.quality <= 0
  end

  def increase_quality_of(item)
    item.quality += 1 unless item.quality >= 50
  end

  def decrease_sell_in_of(item)
    item.sell_in -= 1
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end