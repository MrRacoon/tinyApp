module Config.View exposing (view)

import Config.Types exposing (Model, Msg(..))
import Config.Utils exposing (getLocalString)
import Html exposing (Html, h1, h3, div, text)


view : Model -> Html Msg
view model =
    let
        pageTitle =
            getLocalString "page_title" "en" model
    in
        div []
            [ h1 [] [ text pageTitle ]
            ]
