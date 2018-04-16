module Types exposing (..)

import Config.Types as Config


type alias Model =
    { config : Config.Model
    }


type Msg
    = Anything
    | ConfigMsg Config.Msg
    | ServerMsg String
