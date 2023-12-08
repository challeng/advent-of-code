class Day8
  def initialize(file)
    @map = parse_file(file)
  end

  def part_one
    steps = 0
    current = 'AAA'
    while current != 'ZZZ' do
      dir = @instructions[steps%(@instructions.length)]
      current = @map[current][dir]
      steps += 1
    end
    steps
  end

  def part_two
    starts = @map.select{|k,v| k.end_with?('A') }.keys
    iteration = 0
    steps = starts.each_with_object({}) do |key, obj|
      obj[key] = {current: key, steps: 0}
    end

    steps.each_with_index do |(key,v)|
      done = false
      i = 0
      while !done do
        dir = @instructions[i%(@instructions.length)]
        current = steps[key][:current]

        next_node = @map[current][dir]
        steps[key] = steps[key].merge({current: next_node, steps: steps[key][:steps]+1})
        if next_node.end_with?('Z')
          if steps[key][:steps_to_z].nil?
            steps[key] = steps[key].merge(steps_to_z: steps[key][:steps])
          else
            done = true
            steps[key].merge!(steps_for_loops: steps[key][:steps] - steps[key][:steps_to_z])
          end
        end
        i+=1
      end
    end

    steps.map{|k,v| v[:steps_to_z]}.reduce(1, :lcm)
  end

  def parse_file(file)
    lines = File.readlines(file, chomp: true)
    @instructions = lines[0].split('')
    lines[2..-1].each_with_object({}) do |line, obj|
      key, vals = line[0..-2].split(' = (')
      l,r = vals.split(', ')
      obj[key] = {"L" => l, "R" => r}
    end
  end
end