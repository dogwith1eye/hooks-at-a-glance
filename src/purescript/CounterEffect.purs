module CounterEffect where

import Prelude

import Data.Tuple.Nested ((/\))
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)
import Document(setDocumentTitle)

type Props = ()

counterEffectCpt :: R.Component Props
counterEffectCpt = R.hooksComponent "CounterEffect" cpt
  where
    cpt {} _ = do
      count /\ setCount <- R.useState' 0
      -- Similar to componentDidMount and componentDidUpdate:
      R.useEffect $ do
        -- Update the document title using the browser API
        setDocumentTitle $ "You clicked " <> (show count) <> " times"
        pure $ mempty
      pure $
        H.div {}
          [ H.p {} [ H.text ("You clicked " <> (show count) <> " times") ]
          , H.button { type: "button", on: { click: \_ -> setCount (_ + 1) } } [ H.text "Click me" ]
          ]

counterEffect :: Record Props -> Element
counterEffect props = R.createElement counterEffectCpt props []
