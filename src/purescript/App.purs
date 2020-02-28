module App where

import Reactix.DOM.HTML as H
import Reactix.React (Element)
import Counter (counter)
import CounterEffect (counterEffect)

type Props = ()

app :: Record Props -> Element
app {} =
  H.div {}
    [ H.h1 {} [ H.text "My App" ]
    , counter {}
    , counterEffect {}
    ]
