module Config.State exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Rest exposing (getConfig)
import Config.Json exposing (decodeModel)
import Config.Constants exposing (wsUrl)
import WebSocket exposing (listen)
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Dict exposing (empty)
import Debug exposing (log)


init : ( Model, Cmd Msg )
init =
    Model empty empty empty ! [ getConfig ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ServerMsg str ->
            case decodeModel <| log "ServerModel" str of
                Ok newModel ->
                    newModel ! []

                Err err ->
                    model ! []

        _ ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    listen wsUrl ServerMsg
