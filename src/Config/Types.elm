module Config.Types exposing (..)

import Http exposing (Error)


type alias Model =
    { nodeName : String
    , value : Int
    }


type Msg
    = LoadConfig (Result Error Model)
