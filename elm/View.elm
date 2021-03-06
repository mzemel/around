module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model)
import Events.List


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Events.List.view model.events