require './poker_checker'

describe 'PokerChecker' do
  let(:checker){ PokerChecker.new }

  describe 'check' do
    context 'buta' do
      it {
        expect(checker.check([[:s, 2], [:d, 4], [:h, 8], [:c, 9], [:h, 1]])).to eq :buta
        expect(checker.check([[:s, 1], [:d, 2], [:h, 3], [:c, 4], [:h, 5]])).to eq :buta
      }
    end

    context 'one pair' do
      it {
        expect(checker.check([[:s, 2], [:d, 2], [:h, 8], [:c, 9], [:h, 12]])).to eq :one_pair
        expect(checker.check([[:s, 2], [:d, 8], [:h, 8], [:c, 9], [:h, 12]])).to eq :one_pair
        expect(checker.check([[:s, 2], [:d, 4], [:h, 9], [:c, 9], [:h, 12]])).to eq :one_pair
        expect(checker.check([[:s, 2], [:d, 4], [:h, 8], [:c, 12], [:h, 12]])).to eq :one_pair
      }
    end

    context 'two pair' do
      it {
        expect(checker.check([[:s, 2], [:d, 2], [:h, 8], [:c, 8], [:h, 12]])).to eq :two_pair
        expect(checker.check([[:s, 2], [:d, 4], [:h, 4], [:c, 12], [:h, 12]])).to eq :two_pair
        expect(checker.check([[:s, 2], [:d, 2], [:h, 8], [:c, 12], [:h, 12]])).to eq :two_pair
      }
    end

    context 'three of kind' do
      it {
        expect(checker.check([[:s, 2], [:d, 2], [:h, 2], [:c, 9], [:h, 12]])).to eq :three_of_kind
        expect(checker.check([[:s, 2], [:d, 4], [:h, 4], [:c, 4], [:h, 12]])).to eq :three_of_kind
        expect(checker.check([[:s, 2], [:d, 4], [:d, 12], [:c, 12], [:h, 12]])).to eq :three_of_kind
      }
    end

    context 'full house' do
      it {
        expect(checker.check([[:s, 2], [:d, 2], [:h, 2], [:c, 8], [:h, 8]])).to eq :full_house
        expect(checker.check([[:s, 2], [:d, 2], [:d, 12], [:c, 12], [:h, 12]])).to eq :full_house
      }
    end

    context 'flush' do
      it {
        expect(checker.check([[:s, 2], [:s, 4], [:s, 8], [:s, 10], [:s, 12]])).to eq :flush
        expect(checker.check([[:s, 1], [:s, 2], [:s, 3], [:s, 4], [:s, 5]])).to eq :flush
      }
    end

    context 'straight' do
      it {
        expect(checker.check([[:s, 2], [:d, 3], [:h, 4], [:c, 5], [:h, 6]])).to eq :straight
        expect(checker.check([[:s, 10], [:d, 11], [:h, 12], [:c, 13], [:h, 1]])).to eq :straight
      }
    end

    context 'four of kind' do
      it {
        expect(checker.check([[:s, 2], [:d, 2], [:h, 2], [:c, 2], [:h, 12]])).to eq :four_of_kind
        expect(checker.check([[:s, 2], [:d, 12], [:h, 12], [:c, 12], [:s, 12]])).to eq :four_of_kind
      }
    end

    context 'straight flush' do
      it {
        expect(checker.check([[:s, 2], [:s, 3], [:s, 4], [:s, 5], [:s, 6]])).to eq :straight_flush
        expect(checker.check([[:d, 10], [:d, 11], [:d, 12], [:d, 13], [:d, 1]])).to eq :straight_flush
      }
    end
  end
end

