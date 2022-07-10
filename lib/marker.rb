class Marker
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def self.for(number)
    case number
    when 1
      Marker1
    when 2
      Marker2
    else
      Marker
    end.new(number)
  end

  def marker
    "\u26d4"
  end

  def to_s
    marker
  end
end

class Marker1 < Marker
  def marker
    "\u26aa"
  end
end

class Marker2 < Marker
  def marker
    "\u26ab"
  end
end
