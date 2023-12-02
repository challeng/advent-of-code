class Day2
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    colors_to_min = {'red' => 12, 'blue' => 14, 'green' => 13}
    @inputs.sum do |(game, combos)|
      pass = combos.all? do |(num, color)|
        num <= colors_to_min[color]
      end
      pass ? game : 0
    end
  end

  def part_two
    color_to_index = {'red' => 0, 'blue' => 1, 'green' => 2}
    @inputs.sum do |(_, combos)|
      rgb_min = [0,0,0]
      combos.each do |(num, color)|
        rgb_min[color_to_index[color]] = num if num > rgb_min[color_to_index[color]]
      end
      rgb_min.reduce(:*)
    end
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      game, grabs = line.split(':')
      num = game.split(' ')[1].to_i
      grabs = grabs.split(/;|,/).map do |grab|
        pair = grab.strip!.split(' ')
        [pair[0].to_i, pair[1]]
      end
      [num, grabs]
    end
  end
end
