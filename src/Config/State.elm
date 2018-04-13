module Config.State exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Rest exposing (getConfig)
import Platform.Cmd as Cmd
import Platform.Sub as Sub


init : ( Model, Cmd Msg )
init =
    Model "" 0 ! [ getConfig ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadConfig (Ok config) ->
            config ! []

        LoadConfig (Err err) ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
