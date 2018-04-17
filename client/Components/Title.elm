module Components.Title exposing (..)

import Types exposing (Model, Msg(..))
import Config.Types as ConfigTypes
import Config.Utils exposing (getLocalString, checkFlag)
import Html exposing (Html, h1, text)
import Html.Attributes exposing (style)


render : ConfigTypes.Model -> Html Msg
render config =
    let
        pageTitle =
            getLocalString "page_title" "en" config

        titleUnderline =
            ( "text-decoration"
            , if checkFlag "title_underline" config then
                "underline"
              else
                ""
            )
    in
        h1 [ style [ titleUnderline ] ] [ text pageTitle ]
