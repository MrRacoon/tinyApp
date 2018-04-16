module Main exposing (..)

import Html exposing (program)
import State exposing (init, update, subscriptions)
import View exposing (view)
import Types exposing (Model, Msg(..))


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
