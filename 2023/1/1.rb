class Day1
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    @inputs.sum { |line| line.scan(/\d/).values_at(0,-1).join('').to_i }
  end

  def part_two
    num_map = {'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}
    @inputs.sum do |line|
      line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/)
          .flatten
          .values_at(0,-1)
          .map { |m| num_map.fetch(m, m) }
          .join('')
          .to_i
    end

  end

  def parse_file(file)
    File.readlines(file, chomp: true)
  end
end
