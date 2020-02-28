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
      y /\ setY <- R.useState' 0
      pure $
        H.div {}
          [ H.p {} [H.text ("You clicked " <> (show y) <> " times") ]
          , H.button { type: "button", on: { click: \_ -> setY (_ + 1) } } [ H.text "Click me" ]
          ]

counter :: Record Props -> Element
counter props = R.createElement counterCpt props []
