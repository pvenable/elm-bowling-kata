module Bowling exposing (score)


score : List Int -> Int
score rolls =
    case rolls of
        first :: second :: rest ->
            let
                thisFrame =
                    first + second

                bonus =
                    List.head rest |> Maybe.withDefault 0
            in
            if thisFrame == 10 then
                thisFrame + bonus + score rest
            else
                thisFrame + score rest

        _ ->
            List.sum rolls
