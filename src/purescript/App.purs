module App where

import Reactix.DOM.HTML as H
import Reactix.React (Element)
import Counter (counter)

type Props = ()

app :: Record Props -> Element
app {} =
  H.div {}
    [ H.h1 {} [ H.text "My App" ]
    , counter { count: 0, label: "Count" }
    , counter { count: 0, label: "Click" }
    , counter { count: 0, label: "Interactions" }
    ]
