module Config.Types exposing (..)

import Http exposing (Error)
import Dict exposing (Dict)


type alias StringDict =
    Dict String String


type alias BoolDict =
    Dict String Bool


type alias Model =
    { config : StringDict
    , features : BoolDict
    , localization : Dict String StringDict
    , layout : List String
    }


type Msg
    = LoadConfig (Result Error Model)
    | ServerMsg String
