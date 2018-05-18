module Models exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { events : WebData (List Event)
    }


initialModel : Model
initialModel =
    { events = RemoteData.Loading
    }


type alias EventId =
    Int


type alias Event =
    { id : EventId
    , name : String
    }