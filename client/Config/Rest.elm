module Config.Rest exposing (..)

import Config.Types exposing (Model, Msg(..))
import Config.Json exposing (modelDecoder)
import Http exposing (send, get)


getConfig : Cmd Msg
getConfig =
    send LoadConfig <| get "/config.json" modelDecoder
