module FriendStatus where

import Prelude

import ChatAPI (subscribeToFriendStatus, unsubscribeFromFriendStatus)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Unsafe (unsafePerformEffect)
import FFI.Simple (delay)
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( friend :: { id :: Int } )

friendStatusCpt :: R.Component Props
friendStatusCpt = R.hooksComponent "FriendStatus" cpt
  where
    cpt { friend } _ = do
      isOnline /\ setIsOnline <- R.useState' Nothing

      R.useEffect1 friend.id $ do
        let callback status = unsafePerformEffect $ setIsOnline $ const $ Just status.isOnline
        pure $ subscribeToFriendStatus friend.id callback
        pure $ delay unit $ \_ -> unsubscribeFromFriendStatus friend.id

      pure $ H.div {} [ H.text (showOnline isOnline) ]

    showOnline = case _ of
      Nothing    -> "Loading..."
      Just true  -> "Online"
      Just false -> "Offline"

friendStatus :: Record Props -> Element
friendStatus props = R.createElement friendStatusCpt props []
