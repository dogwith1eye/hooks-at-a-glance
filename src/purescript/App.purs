module App where

import Counter (counter)
import CounterEffect (counterEffect)
import Effect.Ref as Ref
import Effector (EffectorState(..), effector)
import FriendStatus (friendStatus)
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ()

app :: Record Props -> Element
app {} =
  H.div {}
    [ H.h1 {} [ H.text "My App" ]
    , counter {}
    , counterEffect {}
    , friendStatus { friend: { id: 1 } }
    , effector { statetRef: Ref.write Fresh }
    ]
