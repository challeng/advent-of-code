class Day5
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    name = 'seed'
    locs = @seeds
    while name != 'location' do
      key = @mapping.keys.find {|k| k.start_with?(name)}

      locs = locs.map do |loc|
        ret = ''
        @mapping[key].each do |(dest, source, range)|
          if (source..source+range).include?(loc)
            ret = dest + (loc - source)
          end
        end
        ret = loc if ret == ''
        ret
      end

      name = key.split('-to-')[1]
    end

    locs.min
  end

  def part_two
    name = 'seed'
    locs = @seeds.each_slice(2).map {|start,range| [start, start+range-1]}
    while name != 'location' do
      key = @mapping.keys.find {|k| k.start_with?(name)}
      locs = locs.map do |(min,max)|
        out = []
        ranges = @mapping[key].map do |(dest, source, range)|
          {start: source, end: source+range-1, offset: dest-source}
        end.sort {|r1,r2| r1[:start] <=> r2[:start] }

        if min < ranges[0][:start]
          out << [min, [max,ranges[0][:start]].min-1]
        end
        ranges.each_with_index do |range, i|
          next if range[:start] > max
          next if range[:end] < min

          start = [min, range[:start]].max
          stop = [max, range[:end]].min
          out << [start+range[:offset], stop+range[:offset]]

          if max > range[:end] && i != ranges.count-1
            out << [range[:end]+1, [max, ranges[i+1][:start]-1].min]
          end
        end
        if min > ranges[-1][:end]
          out << [min, max]
        end

        out
      end.flatten(1)

      name = key.split('-to-')[1]
    end

    locs.flatten.min
  end

  def parse_file(file)
    @mapping = Hash.new {|h,k| h[k] = []}
    name = ''
    File.readlines(file, chomp: true).map do |line, i|
      if line.include?(':')
        name = line.split(':')[0].chomp(' map')
        @seeds = line.split(':')[1].split(' ').map(&:to_i) if name == 'seeds'
      elsif line[0] in '0'..'9'
        @mapping[name] << line.split(' ').map(&:to_i)
      end
    end
  end
end
