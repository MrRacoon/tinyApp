module State exposing (..)

import Types exposing (Model, Msg(..))
import Config.State as Config
import Platform.Sub as Sub
import Platform.Cmd as Cmd


init : ( Model, Cmd Msg )
init =
    let
        ( configInit, configCmd ) =
            Config.init
    in
        { config = configInit } ! [ Cmd.map ConfigMsg configCmd ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ConfigMsg c ->
            let
                ( configState, _ ) =
                    Config.update c model.config
            in
                { model | config = configState } ! []

        _ ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map ConfigMsg <| Config.subscriptions model.config
        ]
