module Config.Json exposing (..)

import Config.Types exposing (Model, Msg(..))
import Json.Decode as Json
import Dict exposing (Dict)


stringDictDecoder : Json.Decoder (Dict String String)
stringDictDecoder =
    Json.dict Json.string


modelDecoder : Json.Decoder Model
modelDecoder =
    Json.map3 Model
        (Json.field "config" stringDictDecoder)
        (Json.field "feature_flags" stringDictDecoder)
        (Json.field "localization" <| Json.dict stringDictDecoder)
