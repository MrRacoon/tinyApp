module Config.State exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Rest exposing (getConfig)
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Debug exposing (log)


init : ( Model, Cmd Msg )
init =
    Model "" 0 ! [ getConfig ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadConfig (Ok config) ->
            let
                _ =
                    log "error" <| config
            in
                config ! []

        LoadConfig (Err err) ->
            let
                _ =
                    log "error" err
            in
                model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
