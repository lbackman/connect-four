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

  def row(number)
    row_print = ""
    7.times do |i|
      if get_column(i + 1).get_marker(number)
        row_print << get_column(i + 1).get_marker(number)
      else
        row_print << "  "
      end
    end
    row_print
  end

  def current_board
    6.downto(1).map { |i| row(i) }.join("\n")
  end

  def column_win?(number, marker)
    col = instance_variable_get("@col_#{number}")
    1.upto(6)
      .map { |i| col[i] }
      .each_cons(4)
      .any? { |arr| arr == Array.new(4) { marker }}
  end

  alias_method :[], :get_column
end