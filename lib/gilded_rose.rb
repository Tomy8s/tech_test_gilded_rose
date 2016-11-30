class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      case item.name
      when "Sulfuras, Hand of Ragnaros"
        #do nothing
      when "Aged Brie"
        increase_quality_of_cheese(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        increase_quality_of_passes(item)
      else
        reduce_quality_of(item)
      end

      decrease_sell_in_of(item)
    end
  end


  #new methods
  def reduce_quality_of(item, reduction = 1)
    if item.sell_in >= 0
      item.quality -= reduction unless item.quality <= 0
    else
      2.times{ item.quality -= reduction unless item.quality <= 0 }
    end
  end

  def increase_quality_of(item, increase = 1)
    item.quality += increase unless item.quality >= 50
  end

  def increase_quality_of_cheese(item)
    if item.sell_in >= 0
      increase_quality_of(item)
    else
      2.times{ increase_quality_of(item) }
    end
  end

  def increase_quality_of_passes(item)
    if item.sell_in > 10
      increase_quality_of(item)
    elsif item.sell_in <= 10 and item.sell_in > 5
      2.times{ increase_quality_of(item) }
    elsif item.sell_in <= 5 and item.sell_in >=0
      3.times{ increase_quality_of(item) }
    else
      item.quality = 0
    end
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