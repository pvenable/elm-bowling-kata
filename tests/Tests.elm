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
                            [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                    in
                    Expect.equal 0 (score rolls)
            ]
        ]
