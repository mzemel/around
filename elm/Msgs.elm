module Msgs exposing (..)

import Models exposing (Event)
import RemoteData exposing (WebData)


type Msg
    = OnFetchEvents (WebData (List Event))