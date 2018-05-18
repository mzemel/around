module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (EventId, Event)
import RemoteData


fetchEvents : Cmd Msg
fetchEvents =
    Http.get fetchEventsUrl eventsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchEvents


fetchEventsUrl : String
fetchEventsUrl =
    "http://localhost:4000/api/events"


eventsDecoder : Decode.Decoder (List Event)
eventsDecoder =
    Decode.list eventDecoder


eventDecoder : Decode.Decoder Event
eventDecoder =
    decode Event
        |> required "id" Decode.int
        |> required "name" Decode.string
