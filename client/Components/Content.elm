module Components.Content exposing (..)

import Types exposing (Model, Msg(..))
import Config.Types as ConfigTypes
import Config.Utils exposing (getLocalString, checkFlag)
import Html exposing (Html, h3, span, text)


render : ConfigTypes.Model -> Html Msg
render config =
    let
        contents =
            getLocalString "content" "en" config

        shouldShow =
            checkFlag "show_content" config
    in
        if shouldShow then
            h3 [] [ text contents ]
        else
            span [] []
