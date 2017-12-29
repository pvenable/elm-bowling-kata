module Tests exposing (..)

import Bowling exposing (Game)
import Expect
import Test exposing (..)


all : Test
all =
    describe "Bowling.score"
        [ describe "with all gutters"
            [ test "it returns 0" <|
                \() ->
                    Bowling.newGame
                        |> rollMany 0 20
                        |> Bowling.score
                        |> Expect.equal 0
            ]
        , describe "with all open frames"
            [ test "it returns the sum of all rolls" <|
                \() ->
                    Bowling.newGame
                        |> rollMany 1 20
                        |> Bowling.score
                        |> Expect.equal 20
            ]
        , describe "with a spare"
            [ test "it returns the sum of all rolls plus spare bonus" <|
                \() ->
                    Bowling.newGame
                        |> Bowling.roll 9
                        |> rollMany 1 19
                        |> Bowling.score
                        |> Expect.equal 29
            ]
        , describe "with a strike"
            [ test "it returns the sum of all rolls plus strike bonus" <|
                \() ->
                    Bowling.newGame
                        |> Bowling.roll 10
                        |> rollMany 1 18
                        |> Bowling.score
                        |> Expect.equal 30
            ]
        , describe "with a perfect game"
            [ test "it returns 300" <|
                \() ->
                    Bowling.newGame
                        |> rollMany 10 12
                        |> Bowling.score
                        |> Expect.equal 300
            ]
        ]


rollMany : Int -> Int -> Game -> Game
rollMany pins times game =
    if times > 0 then
        Bowling.roll pins game
            |> rollMany pins (times - 1)
    else
        game
