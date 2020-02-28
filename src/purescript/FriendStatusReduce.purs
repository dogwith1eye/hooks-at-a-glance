module FriendStatusReduce where

import Prelude

import ChatAPI (subscribeToFriendStatus, unsubscribeFromFriendStatus)
import DOM.Simple.Event (offsetX)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Console (log, logShow)
import Effect.Unsafe (unsafePerformEffect)
import ReactUpdate (UpdateMsg(..), useReducer')
import Reactix as R
import Reactix.DOM.HTML as H
import Reactix.React (Element)

type Props = ( friend :: { id :: Int } )

type Model = { id :: Int, isOnline :: Maybe Boolean }

data Msg
  = Subscribe
  | UpdateStatus (Maybe Boolean)

friendStatusReduceCpt :: R.Component Props
friendStatusReduceCpt = R.hooksComponent "FriendStatusReduce" cpt
  where
    cpt { friend } _ = do
      model /\ dispatch <- useReducer' reducer { id : friend.id, isOnline : Nothing }

      R.useEffect $ do
        log "HUH???"
        dispatch Subscribe
        pure $ mempty

      pure $ H.div {} [ H.text (showOnline model.isOnline) ]

    subscribe :: Tuple Model (Msg -> Effect Unit) -> Effect Unit
    subscribe (state /\ dispatch) = do
      _ <- pure $ subscribeToFriendStatus state.id (\status -> unsafePerformEffect $ dispatch (UpdateStatus $ Just status.isOnline))
      pure $ mempty

    reducer :: Model -> Msg -> (UpdateMsg Model Msg)
    reducer model = case _ of
      Subscribe              -> SideEffect(subscribe)
      UpdateStatus isOnline  -> Update(model { isOnline = isOnline })

    showOnline :: (Maybe Boolean) -> String
    showOnline = case _ of
      Nothing    -> "Reduce Loading..."
      Just true  -> "Reduce Online"
      Just false -> "Reduce Offline"

friendStatusReduce :: Record Props -> Element
friendStatusReduce props = R.createElement friendStatusReduceCpt props []
