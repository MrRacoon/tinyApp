module Config.Types exposing (..)

import Http exposing (Error)


type alias Model =
    { node_name : String
    , value : Int
    }


type Msg
    = LoadConfig (Result Error Model)
