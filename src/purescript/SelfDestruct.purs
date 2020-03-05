module SelfDestruct where

import Prelude

import Data.Tuple.Nested ((/\))
import Effect.Timer as T
import FFI.Simple (delay)
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( milliseconds :: Int )

useExpiration :: Int -> R.Hooks Boolean
useExpiration milliseconds = do
  shouldRender /\ setShouldRender <- R.useState' true
  R.useEffect1' milliseconds $ do
    timeoutId <- T.setTimeout milliseconds $ do
      void $ setShouldRender $ const $ false
    pure $ delay unit $ \_ -> T.clearTimeout timeoutId
  pure $ shouldRender

useExpirationUI :: Int -> Array Element -> R.Hooks (Array Element)
useExpirationUI milliseconds renderableThings = do
  shouldRender <- useExpiration milliseconds
  pure $ if shouldRender then renderableThings else []

selfDestructCpt :: R.Component Props
selfDestructCpt = R.hooksComponent "SelfDestruct" cpt
  where
    cpt { milliseconds } children = do
      expires <- useExpirationUI milliseconds children
      pure $ H.div {} expires

selfDestruct :: Record Props -> Array Element -> Element
selfDestruct props children = R.createElement selfDestructCpt props children
