class Map
  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  def set(key,value)
    #sets index to pair_index if the key we are trying to set exist in underlying_array
    #pair_index will a be truthy if index is found
    #pair_index will be nil(falsey) if not
    pair_index = underlying_array.index {|pair| pair[0] == key}
    if pair_index
      #if index exist, set the "new" value to the key
      underlying_array[pair_index][1] = value
    else
      #if index was not found, push in the new key and index pair
      underlying_array << [key,value]
    end
    value
  end

  def get(key)
    underlying_array.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end
  #maybe call it delete!
  def delete(key)
    underlying_array.reject! {|pair| pair[0] == key}
  end

  def show
    deepdup(underlying_array)
  end

  def deepdup(arr)
    arr.map {|el| el.is_a?(Array) ? deepdup(el) : el}
  end



end
