module Bowling exposing (score)

import List exposing (drop, head, sum, tail, take)
import Maybe exposing (withDefault)


score : List Int -> Int
score rolls =
    if isStrike rolls then
        let
            rest =
                drop 1 rolls
        in
        10 + strikeBonus rolls + score rest
    else if isSpare rolls then
        let
            rest =
                drop 2 rolls
        in
        10 + spareBonus rolls + score rest
    else
        sum rolls


isSpare : List Int -> Bool
isSpare rolls =
    (rolls |> take 2 |> sum) == 10


isStrike : List Int -> Bool
isStrike rolls =
    (head rolls |> withDefault 0) == 10


spareBonus : List Int -> Int
spareBonus rolls =
    rolls |> drop 2 |> head |> withDefault 0


strikeBonus : List Int -> Int
strikeBonus rolls =
    rolls |> drop 1 |> take 2 |> sum
