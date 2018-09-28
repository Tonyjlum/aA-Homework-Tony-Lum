class Queue
  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  def enqueue(val)
    @underlying_array.push(val)
    val
  end

  def dequeue
    @underlying_array.shift
  end

  def peek
    @underlying_array.first
  end
end
