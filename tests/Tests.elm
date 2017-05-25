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
            [ test "it returns the sum" <|
                \() ->
                    let
                        rolls =
                            List.repeat 20 1
                    in
                    Expect.equal 20 (score rolls)
            ]
        ]
