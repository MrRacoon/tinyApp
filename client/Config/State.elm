module Config.State exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Json exposing (decodeModel)
import Config.Rest exposing (getConfig)
import Config.Constants exposing (wsUrl)
import WebSocket exposing (listen)
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Dict exposing (empty)
import Debug exposing (log)


init : ( Model, Cmd Msg )
init =
    Model empty empty empty [] ! [ getConfig ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadConfig (Err err) ->
            let
                _ =
                    log ("Load Error:") err
            in
                model ! []

        LoadConfig (Ok newModel) ->
            newModel ! []

        ServerMsg str ->
            case decodeModel <| log "ServerModel" str of
                Ok newModel ->
                    newModel ! []

                Err err ->
                    model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    listen wsUrl ServerMsg
