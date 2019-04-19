class PokerChecker
  def check(cards)
    case cards.sort { @1[1] <=> @2[1] }
      in [[m, a], [^m, b], [^m, c], [^m, d], [^m, e]] if a != 1 && [a, b, c, d].zip([b, c, d, e]).map { @2 - @1 }.all? { @1 == 1 } ; :straight_flush
      in [[m, 1], [^m, 10], [^m, 11], [^m, 12], [^m, 13]]; :straight_flush
      in [[_, a], [_, ^a], [_, ^a], [_, ^a], [_, _]]; :four_of_kind
      in [[_, _], [_, a], [_, ^a], [_, ^a], [_, ^a]]; :four_of_kind
      in [[_, a], [_, b], [_, c], [_, d], [_, e]] if a != 1 && [a, b, c, d].zip([b, c, d, e]).map { @2 - @1 }.all? { @1 == 1 } ; :straight
      in [[_, 1], [_, 10], [_, 11], [_, 12], [_, 13]]; :straight
      in [[m, _], [^m, _], [^m, _], [^m, _], [^m, _]]; :flush
      in [[_, a], [_, ^a], [_, b], [_, ^b], [_, ^b]]; :full_house
      in [[_, a], [_, ^a], [_, ^a], [_, b], [_, ^b]]; :full_house
      in [[_, a], [_, ^a], [_, ^a], [_, _], [_, _]]; :three_of_kind
      in [[_, _], [_, a], [_, ^a], [_, ^a], [_, _]]; :three_of_kind
      in [[_, _], [_, _], [_, a], [_, ^a], [_, ^a]]; :three_of_kind
      in [[_, a], [_, ^a], [_, b], [_, ^b], [_, _]]; :two_pair
      in [[_, _], [_, a], [_, ^a], [_, b], [_, ^b]]; :two_pair
      in [[_, a], [_, ^a], [_, _], [_, b], [_, ^b]]; :two_pair
      in [[_, a], [_, ^a], [_, _], [_, _], [_, _]]; :one_pair
      in [[_, _], [_, a], [_, ^a], [_, _], [_, _]]; :one_pair
      in [[_, _], [_, _], [_, a], [_, ^a], [_, _]]; :one_pair
      in [[_, _], [_, _], [_, _], [_, a], [_, ^a]]; :one_pair
      else; :buta
    end
  end
end

