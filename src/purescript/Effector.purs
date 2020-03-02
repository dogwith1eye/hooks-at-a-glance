module Effector where

import Prelude

import Effect.Ref as Ref
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( stateRef :: Ref.Ref EffectorState )

data EffectorState = Fresh | Initialised | Done

derive instance eqEffectorState :: Eq EffectorState

instance showEffectorState :: Show EffectorState where
  show Fresh = "fresh"
  show Initialised = "initialised"
  show Done = "done"

type EffectorProps = ( stateRef :: Ref.Ref EffectorState )

effectorCpt :: R.Component EffectorProps
effectorCpt = R.hooksComponent "Effector" cpt
  where cpt {stateRef} _ = do
          R.useEffect $ do
            Ref.write Initialised stateRef
            pure $ Ref.write Done stateRef
          pure $ H.div {} []

effector :: Record Props -> Element
effector props = R.createElement effectorCpt props []
