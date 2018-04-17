module Config.View exposing (view)

import Config.Types exposing (Model, Msg(..))
import Config.Utils exposing (getLocalString, checkFlag)
import Html exposing (Html, h1, h3, div, text)
import Html.Attributes exposing (style)


view : Model -> Html Msg
view model =
    let
        welcome_msg =
            getLocalString "welcome_msg" "en" model
    in
        div []
            [ h1 [ style [ titleUnderline ] ] [ text pageTitle ]
            , h3 [] [ text welcome_msg ]
            ]
