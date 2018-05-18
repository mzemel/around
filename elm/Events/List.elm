module Events.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (Event)
import RemoteData exposing (WebData)


view : WebData (List Event) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Events" ] ]


list : List Event -> Html Msg
list events =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map eventRow events)
            ]
        ]


eventRow : Event -> Html Msg
eventRow event =
    tr []
        [ td [] [ text (toString event.id) ]
        , td [] [ text event.name ]
        , td []
            []
        ]

maybeList : WebData (List Event) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success events ->
            list events

        RemoteData.Failure error ->
            text (toString error)