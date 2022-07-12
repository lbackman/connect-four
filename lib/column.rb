class Column
  def initialize(number = 1)
    @number = number
    @items = {}
    @slots_used = 0
  end

  def get_marker(index)
    if @items[index]
      "#{@items[index]}"
    else
      "  "
    end
  end

  def drop_marker!(value = 'marker_1')
    if @slots_used < 6
      @items[@slots_used + 1] = value
      @slots_used += 1
    else
      "Column #{@number} is full, please choose another"
    end
  end

  alias_method :[], :get_marker
  alias_method :[]=, :drop_marker!
end