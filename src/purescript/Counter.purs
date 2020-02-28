module Counter where

import Prelude

import Data.Tuple.Nested ((/\))
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ()

counterCpt :: R.Component Props
counterCpt = R.hooksComponent "Counter" cpt
  where
    cpt {} _ = do
      count /\ setCount <- R.useState' 0
      pure $
        H.div {}
          [ H.p {} [ H.text ("You clicked " <> (show count) <> " times") ]
          , H.button { type: "button", on: { click: \_ -> setCount (_ + 1) } } [ H.text "Click me" ]
          ]

counter :: Record Props -> Element
counter props = R.createElement counterCpt props []
