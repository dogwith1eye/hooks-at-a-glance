module FriendStatus where

import Prelude

import ChatAPI (subscribeToFriendStatus, unsubscribeFromFriendStatus)
import Data.Tuple.Nested ((/\))
import Effect.Unsafe (unsafePerformEffect)
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( friend :: { id :: Int } )

friendStatusCpt :: R.Component Props
friendStatusCpt = R.hooksComponent "FriendStatus" cpt
  where
    cpt { friend } _ = do
      isOnline /\ setIsOnline <- R.useState' false

      R.useEffect1 friend.id $ do
        let callback status = unsafePerformEffect $ setIsOnline $ const $ status.isOnline
        pure $ subscribeToFriendStatus friend.id callback
        pure $ R.nothing
        --pure $ (\_ -> unsubscribeFromFriendStatus friend.id)

      pure $ H.div {} [ H.text (if isOnline then "Online" else "Offline") ]

friendStatus :: Record Props -> Element
friendStatus props = R.createElement friendStatusCpt props []
