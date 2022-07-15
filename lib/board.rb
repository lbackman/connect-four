require_relative 'column'

class Board
  def initialize
    7.times { |i| instance_variable_set("@col_#{i + 1}", Column.new(i + 1)) }
  end

  def place_marker!(marker, number)
    get_column(number).drop_marker!(marker)
  end

  def full?
    1.upto(7)
      .map { |i| get_column(i).slots_used }
      .all? { |n| n == 6 }
  end

  def current_board
      rows = []
      6.downto(1) { |i| rows << row(i) }
      "\n#{rows.join(separator)}#{separator}#{number_line}"
  end

  def win?(marker)
    any_column_win?(marker) || any_row_win?(marker) ||
    any_ascending_win?(marker) || any_descending_win?(marker)
  end

  private

  def get_column(number)
    instance_variable_get("@col_#{number}")
  end

  def row(number)
    row_print = []
    7.times do |i|
      row_print << " #{get_column(i + 1).get_marker(number)} "
    end
    "\t|#{row_print.join("|")}|"
  end

  def separator
    "\n\t+----+----+----+----+----+----+----+\n"
  end

  def number_line
    "\t  \u2460    \u2461    \u2462    \u2463    \u2464    \u2465    \u2466   \n\n"
  end

  def column_win?(column, marker)
    1.upto(6)
      .map { |i| get_column(column).get_marker(i) }
      .each_cons(4)
      .any? { |arr| arr.all? { |n| n == marker } }
  end

  def any_column_win?(marker)
    1.upto(7)
      .map { |i| column_win?(i, marker) }
      .any?
  end

  def row_win?(row, marker)
    1.upto(7)
      .map { |i| get_column(i).get_marker(row) }
      .each_cons(4)
      .any? { |arr| arr.all? { |n| n == marker } }
  end

  def any_row_win?(marker)
    1.upto(6)
      .map { |i| row_win?(i, marker) }
      .any?
  end

  def diagonal_ascending_win?(column, row, marker)
    1.upto(4)
      .map { |i| get_column(column - 1 + i).get_marker(row - 1 + i) }
      .all? { |n| n == marker }
  end

  def any_ascending_win?(marker)
    1.upto(4)
      .map { |i| 1.upto(3)
      .map { |j| diagonal_ascending_win?(i, j, marker) } }
      .flatten
      .any?
  end

  def diagonal_descending_win?(column, row, marker)
    1.upto(4)
      .map { |i| get_column(column + i - 1).get_marker(row - i + 1) }
      .all? { |n| n == marker }
  end

  def any_descending_win?(marker)
    1.upto(4)
      .map { |i| 6.downto(4)
      .map { |j| diagonal_descending_win?(i, j, marker) } }
      .flatten
      .any?
  end

  alias_method :[], :get_column
end