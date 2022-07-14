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
    dropped = false
    if @slots_used < 6
      @items[@slots_used + 1] = value
      @slots_used += 1
      dropped = true
    else
      puts column_full_message
    end
    dropped
  end

  def column_full_message
    "Column #{@number} is full, please choose another"
  end

  alias_method :[], :get_marker
  alias_method :[]=, :drop_marker!
end