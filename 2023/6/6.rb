class Day6
  def initialize(file)
    @inputs_a = parse_file_a(file)
    @inputs_b = parse_file_b(file)
  end

  def part_one
    @inputs_a.map { |(time, distance)| winning_race_count(time,distance) }
             .reduce(&:*)

  end

  def part_two
    winning_race_count(*@inputs_b)
  end

  def winning_race_count(time, distance)
    (0..time).map { |t| t * (time-t) }
             .select{|race| race > distance}
             .count
  end

  def parse_file_a(file)
    File.readlines(file, chomp: true).map do |line, i|
      line.split(':')[1].split(' ').map(&:to_i)
    end.transpose
  end

  def parse_file_b(file)
    File.readlines(file, chomp: true).map do |line|
      line.split(':')[1].split(' ').join('').to_i
    end
  end
end
