require 'column'

class Board
  def initialize
    7.times { |i| instance_variable_set("@col_#{i + 1}", Column.new(i + 1)) }
  end

  def get_column(number)
    instance_variable_get("@col_#{number}")
  end

  def place_marker!(marker, number)
    get_column(number).drop_marker!(marker)
  end

  alias_method :[], :get_column
end