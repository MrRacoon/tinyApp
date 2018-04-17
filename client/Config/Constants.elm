module Config.Constants exposing (..)


wsHost : String
wsHost =
    "127.0.0.1"


wsPort : Int
wsPort =
    8081


wsUrl : String
wsUrl =
    "ws://" ++ wsHost ++ ":" ++ toString wsPort
