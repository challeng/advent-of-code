class Day4
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    @inputs.sum do |(winning, yours)|
      matches = (winning & yours).count - 1
      matches >= 0 ? 2 ** matches : 0
    end
  end

  def part_two
    times_to_play = {}
    @inputs.each_with_index do |(winning, yours), i|
      matches = (winning & yours).count
      times_to_play[i+1] ||= 1
      times_to_play[i+1].times do
        matches.times do |times|
          times_to_play[i+times+2] ||= 1
          times_to_play[i+times+2] += 1
        end
      end
    end

    times_to_play.values.sum
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      line.split(':')[1].split('|').map {|set| set.split(' ').map(&:to_i) }
    end
  end
end
