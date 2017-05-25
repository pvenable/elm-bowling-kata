module Tests exposing (..)

import Bowling exposing (score)
import Expect
import Test exposing (..)


all : Test
all =
    describe "Bowling.score"
        [ describe "with all gutters"
            [ test "it returns 0" <|
                \() ->
                    let
                        rolls =
                            List.repeat 20 0
                    in
                    Expect.equal 0 (score rolls)
            ]
        , describe "with all open frames"
            [ test "it returns the sum of all rolls" <|
                \() ->
                    let
                        rolls =
                            List.repeat 20 1
                    in
                    Expect.equal 20 (score rolls)
            ]
        , describe "with a spare"
            [ test "it returns the sum of all rolls plus spare bonus" <|
                \() ->
                    let
                        rolls =
                            List.append [ 9, 1 ] (List.repeat 18 1)
                    in
                    Expect.equal 29 (score rolls)
            ]
        , describe "with a strike"
            [ test "it returns the sum of all rolls plus strike bonus" <|
                \() ->
                    let
                        rolls =
                            10 :: List.repeat 18 1
                    in
                    Expect.equal 30 (score rolls)
            ]
        ]
