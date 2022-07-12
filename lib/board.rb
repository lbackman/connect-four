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
    1.upto(6)
      .map { |i| get_column(number).get_marker(i) }
      .each_cons(4)
      .any? { |arr| arr.all? { |n| n == marker } }
  end

  def row_win?(number, marker)
    1.upto(7)
      .map { |i| get_column(i).get_marker(number) }
      .each_cons(4)
      .any? { |arr| arr.all? { |n| n == marker } }
  end

  def diagonal_ascending_win?(column, row, marker)
    1.upto(4)
      .map { |i| get_column(column - 1 + i).get_marker(row - 1 + i) }
      .all? { |n| n == marker }
  end

  def diagonal_descending_win?(column, row, marker)
    1.upto(4)
      .map { |i| get_column(column + i - 1).get_marker(row - i + 1) }
      .all? { |n| n == marker }
  end

  alias_method :[], :get_column
end