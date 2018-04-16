module View exposing (..)

import Types exposing (Model, Msg(..))
import Config.View as Config
import Html exposing (Html, div, text)


view : Model -> Html Msg
view model =
    div []
        [ Html.map ConfigMsg (Config.view model.config)
        ]
