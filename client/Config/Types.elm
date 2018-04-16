module Config.Types exposing (..)

import Http exposing (Error)
import Dict exposing (Dict)


type alias StringDict =
    Dict String String


type alias Model =
    { config : StringDict
    , features : StringDict
    , localization : Dict String StringDict
    }


type Msg
    = LoadConfig (Result Error Model)
