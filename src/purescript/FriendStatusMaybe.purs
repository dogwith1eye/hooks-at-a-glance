module FriendStatusMaybe where

import Prelude

import ChatAPI (subscribeToFriendStatus, unsubscribeFromFriendStatus)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Console (logShow)
import Effect.Unsafe (unsafePerformEffect)
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( friend :: { id :: Int } )

friendStatusCpt :: R.Component Props
friendStatusCpt = R.hooksComponent "FriendStatusMaybe" cpt
  where
    cpt { friend } _ = do
      isOnline /\ setIsOnline <- R.useState' Nothing

      R.useEffectOnce $ do
        let callback status = unsafePerformEffect $ setIsOnline $ const $ Just status.isOnline
        pure $ subscribeToFriendStatus friend.id $ callback
        pure $ mempty

      pure $ H.div {} [ H.text (showOnline isOnline) ]

    showOnline = case _ of
      Nothing    -> "Loading..."
      Just true  -> "Online"
      Just false -> "Offline"


friendStatus :: Record Props -> Element
friendStatus props = R.createElement friendStatusCpt props []
