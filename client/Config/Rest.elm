module Config.Rest exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Json exposing (modelDecoder)
import Http exposing (send, get)


getConfig =
    send LoadConfig <| get "/data.json" modelDecoder
