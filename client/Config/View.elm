module Config.View exposing (view)

import Config.Types exposing (Model, Msg(..))
import Html exposing (Html, h1, h3, div, text)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.nodeName ]
        , h3 [] [ text <| "Value is: " ++ toString model.value ]
        ]
