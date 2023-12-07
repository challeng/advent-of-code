class Day7
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    sum_bids
  end

  def part_two
    sum_bids(wildcard: true)
  end

  def sum_bids(wildcard: false)
    sorted = @inputs.sort do |(h1,_),(h2,_)|
      h1_score = score_hand(h1,wildcard: wildcard)
      h2_score = score_hand(h2,wildcard: wildcard)

      hand_compare = h1_score <=> h2_score
      next hand_compare if hand_compare != 0

      high_compare = h1.zip(h2).each do |h1c, h2c|
        comp = score_card(h1c,wildcard: wildcard) <=> score_card(h2c,wildcard: wildcard)
        break comp if comp != 0
      end
      high_compare != 0 ? high_compare : 0
    end

    sorted.each_with_index.sum { |(_,bid), i| bid * (i+1) }
  end

  def score_card(card, wildcard:false)
    {
      'A' => 15,
      'K' => 14,
      'Q' => 13,
      'J' => wildcard ? 1 : 12,
      'T' => 10,
    }.fetch(card, card.to_i)
  end

  def score_hand(hand, wildcard:false)
    scores = {
      [5] => 7,
      [1,4] => 6,
      [2,3] => 5,
      [1,1,3] => 4,
      [1,2,2] => 3,
      [1,1,1,2] => 2,
      [1,1,1,1,1] => 1
    }
    if wildcard
      if hand != %w[J J J J J]
        most_card = hand.select{|c| c != 'J'}.tally.sort_by{|k,v| v}.last.first
        hand = hand.map {|c| c == 'J' ? most_card : c}
      end
    end
    scores[hand.tally.values.sort]
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      hand,bid = line.split(' ')
      [hand.split(''), bid.to_i]
    end
  end
end
