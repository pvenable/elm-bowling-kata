module Bowling exposing (score)


score : List Int -> Int
score rolls =
    List.sum rolls
