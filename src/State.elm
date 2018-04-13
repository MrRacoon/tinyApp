module State exposing (..)

import Types exposing (Model, Msg(..))
import Platform.Sub as Sub
import Platform.Cmd as Cmd


init : ( Model, Cmd Msg )
init =
    [] ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
