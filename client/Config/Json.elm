module Config.Json exposing (..)

import Config.Types exposing (Model, Msg(..))
import Json.Decode as Json


modelDecoder : Json.Decoder Model
modelDecoder =
    Json.map2 Model
        (Json.field "node_name" Json.string)
        (Json.field "value" Json.int)