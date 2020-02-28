module App where

import Reactix.DOM.HTML as H
import Reactix.React (Element)
import Counter (counter)
import CounterEffect (counterEffect)
import FriendStatus (friendStatus)

type Props = ()

app :: Record Props -> Element
app {} =
  H.div {}
    [ H.h1 {} [ H.text "My App" ]
    , counter {}
    , counterEffect {}
    , friendStatus { friend: { id: 1 } }
    ]
