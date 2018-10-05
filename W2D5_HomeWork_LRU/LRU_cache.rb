class LRUCache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
    # returns number of elements currently in cache
  end

  def add(el)
    #checks if it includes it already in cache. if it does, remove it and replace it at the end.
    if @cache.include?(el)
      #if the instance of el exist, just remove the one that is there and add a new instance of it so its last in line to be removed
      @cache.delete(el)
      @cache << el
    elsif self.count >= @size
      #if cache is at its limit, remove the first array that was in it and replace it with the newest
      @cache.shift
      @cache << el
    else
      @cache <<el
    end



    # adds element to cache according to LRU principle
  end

  def show
    puts @cache
    puts "This is the Cache!"
    # shows the items in the cache, with the LRU item first
    #do not want to return the values?
  end

  private
  # helper methods go here!

end
