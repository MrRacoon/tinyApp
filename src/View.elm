module View exposing (..)

import Types exposing (Model, Msg(..))
import Html exposing (Html, div, text)


view : Model -> Html Msg
view model =
    div [] [ text "Hi" ]
