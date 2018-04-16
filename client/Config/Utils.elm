module Config.Utils exposing (..)

import Config.Types exposing (Model)
import Dict as D


getLocalString : String -> String -> Model -> String
getLocalString name lang model =
    D.get name model.localization
        |> Maybe.withDefault D.empty
        |> D.get lang
        |> Maybe.withDefault name
