class CircularBuffer
  def initialize(size : Int32)
    @buffer = Array(Int32).new(size, 0)
    @oldest = 0
    @count = 0
  end

  def write(data)
    raise RuntimeError.new("Buffer is full") if @count == @buffer.size
    @buffer[(@oldest + @count) % @buffer.size] = data
    @count += 1
  end

  def read
    raise RuntimeError.new("Buffer is empty") if @count == 0
    data = @buffer[@oldest]
    @oldest = (@oldest + 1) % @buffer.size
    @count -= 1
    data
  end

  def overwrite(data)
    read if @count == @buffer.size
    write(data)
  end

  def clear
    @oldest = 0
    @count = 0
  end
end
