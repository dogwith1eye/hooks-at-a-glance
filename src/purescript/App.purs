module App where

import Counter (counter)
import CounterEffect (counterEffect)
import FriendStatus (friendStatus)
import SelfDestruct (selfDestruct)
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ()

app :: Record Props -> Element
app {} =
  H.div {}
    [ H.h1 {} [ H.text "My App" ]
    , counter {}
    , counterEffect {}
    , selfDestruct { milliseconds:5000 } [ friendStatus { friend: { id: 1 } } ]
    ]
