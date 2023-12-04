class Day3
  def initialize(file)
    parse_file(file)
  end

  def part_one
    @nums.sum do |(num, *coors)|
      adjacent_to_symbol?(coors) ? num.to_i : 0
    end
  end

  def part_two
    star_map = Hash.new {|h,k| h[k] = []}
    @nums.each do |(num, *coors)|
      star_coor = adjacent_star_coor(coors)
      star_map[star_coor] << num.to_i if star_coor
    end

    star_map.select {|_, nums| nums.length == 2}
            .map {|_, nums| nums.reduce(&:*) }
            .sum
  end

  def adjacent_to_symbol?(coors)
    coors.any? do |(x,y)|
      diagonals(x,y).any? {|coor| ![*('0'..'9'), '.'].include?(@map[coor])}
    end
  end

  def adjacent_star_coor(coors)
    coors.each do |(x,y)|
      diagonals(x,y).each do |coor|
        return coor if @map[coor] == '*'
      end
    end
    nil
  end

  def diagonals(x,y)
    [[x-1,y], [x+1,y], [x,y-1], [x,y+1], [x-1,y-1], [x-1,y+1], [x+1,y-1], [x+1,y+1]]
  end

  def parse_file(file)
    @map = Hash.new('.')
    @nums = []
    num = ['']
    lines = File.readlines(file, chomp: true)
    lines.each_with_index do |line, y|
      @nums << num && num = [''] if num != ['']
      line.each_char.with_index do |c, x|
        @map[[x,y]] = c
        if (c in '0'..'9')
          num[0] += c
          num << [x,y]
        else
          @nums << num && num = [''] if num != ['']
        end
      end
    end
  end
end
