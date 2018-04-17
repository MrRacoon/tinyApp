module View exposing (..)

import Types exposing (Model, Msg(..))
import Config.Types as ConfigTypes
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Components.Title as Title
import Components.WelcomeMsg as WelcomeMsg
import Components.Content as Content


view : Model -> Html Msg
view model =
    renderLayout model.config


renderComponent : ConfigTypes.Model -> String -> Html Msg
renderComponent config str =
    case str of
        "title" ->
            Title.render config

        "welcome_msg" ->
            WelcomeMsg.render config

        "content" ->
            Content.render config

        _ ->
            nonLayout str


renderLayout : ConfigTypes.Model -> Html Msg
renderLayout config =
    config.layout
        |> List.map (renderComponent config)
        |> div []


nonLayout : String -> Html Msg
nonLayout label =
    div [ style [ ( "display", "none" ) ] ] [ text label ]
