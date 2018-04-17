module Config.Utils exposing (..)

import Config.Types exposing (Model)
import Dict as D
import Debug exposing (log)


checkFlag : String -> Model -> Bool
checkFlag flagName model =
    case D.get flagName model.features of
        Just val ->
            log ("FlagSet " ++ flagName ++ " to") val

        Nothing ->
            log ("Defaulting " ++ flagName ++ " to") False


getLocalString : String -> String -> Model -> String
getLocalString name lang model =
    D.get name model.localization
        |> Maybe.withDefault D.empty
        |> D.get lang
        |> Maybe.withDefault name
