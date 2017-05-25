module Bowling exposing (score)

import List exposing (drop, head, sum, tail, take)
import Maybe exposing (withDefault)


score : List Int -> Int
score rolls =
    scoreFrames 10 rolls


scoreFrames : Int -> List Int -> Int
scoreFrames frames rolls =
    let
        remainingFrames =
            frames - 1
    in
    if frames == 0 then
        0
    else if isStrike rolls then
        let
            rest =
                drop 1 rolls
        in
        10 + strikeBonus rolls + scoreFrames remainingFrames rest
    else if isSpare rolls then
        let
            rest =
                drop 2 rolls
        in
        10 + spareBonus rolls + scoreFrames remainingFrames rest
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
