class Day9
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    sum_el_index(-1)
  end

  def part_two
    sum_el_index(0)
  end

  def sum_el_index(idx)
    @inputs.sum do |seq|
      down_seq = calc_down_for_seq([seq])
      down_seq[-1] = [0, *down_seq.last, 0]
      calc_up_for_seq(down_seq.reverse)[idx]
    end
  end

  def calc_down_for_seq(seq)
    return seq if seq.last.all? {|n| n==0}

    next_row = seq.last.each_cons(2).map { |a,b| b-a }
    calc_down_for_seq([*seq,next_row])
  end

  def calc_up_for_seq(seq)
    return seq[0] if seq.length == 1

    bottom, up = seq.take(2)
    last = bottom.last + up.last
    first = up.first - bottom.first
    calc_up_for_seq([[first, *up, last], *seq[2..-1]])
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      line.split(' ').map(&:to_i)
    end
  end
end
