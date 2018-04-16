module State exposing (..)

import Types exposing (Model, Msg(..))
import Config.State as Config
import Platform.Sub as Sub
import Platform.Cmd as Cmd
import Debug exposing (log)
import Constants exposing (wsUrl)
import WebSocket exposing (listen)


init : ( Model, Cmd Msg )
init =
    let
        ( configInit, configCmd ) =
            Config.init
    in
        { config = configInit
        }
            ! [ Cmd.map ConfigMsg configCmd ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ConfigMsg c ->
            let
                ( configState, _ ) =
                    Config.update c model.config
            in
                { model | config = configState } ! []

        ServerMsg str ->
            let
                _ =
                    log "ServerMsg" str
            in
                model ! []

        _ ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    listen wsUrl ServerMsg
