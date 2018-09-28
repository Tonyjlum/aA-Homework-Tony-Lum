class Stack
  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  #only work with things on the end of array.
  #only supports 2 modifications (push and pop)


  def push(values)
    underlying_array.push(values)
    values
  end

  def pop
    underlying_array.pop
  end
  
  #can only see the last part of the stack
  def peek
    underlying_array.last
  end

end
