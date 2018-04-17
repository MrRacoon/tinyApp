module Config.Json exposing (..)

import Config.Types exposing (Model, Msg(..))
import Json.Decode as Json
import Dict exposing (Dict)


booleanDecoder : Json.Decoder Bool
booleanDecoder =
    Json.string |> Json.andThen parseBool


parseBool : String -> Json.Decoder Bool
parseBool m =
    case m of
        "true" ->
            Json.succeed True

        _ ->
            Json.succeed False


stringDictDecoder : Json.Decoder (Dict String String)
stringDictDecoder =
    Json.dict Json.string


modelDecoder : Json.Decoder Model
modelDecoder =
    Json.map3 Model
        (Json.field "config" stringDictDecoder)
        (Json.field "feature_flags" <| Json.dict booleanDecoder)
        (Json.field "localization" <| Json.dict stringDictDecoder)


decodeModel : String -> Result String Model
decodeModel =
    Json.decodeString modelDecoder
