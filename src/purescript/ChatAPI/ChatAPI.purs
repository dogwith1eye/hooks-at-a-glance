module ChatAPI
( subscribeToFriendStatus, unsubscribeFromFriendStatus
) where

import Prelude

import FFI.Simple ((...))
import FFI.Simple.PseudoArray as PA

foreign import data ChatAPI :: Type

foreign import chatAPI :: ChatAPI

type Status = { isOnline :: Boolean }

subscribeToFriendStatus :: Int -> (Status -> Unit) -> Unit
subscribeToFriendStatus id callback = chatAPI ... "subscribeToFriendStatus" $ args
  where args = PA.unshift id $ PA.unshift callback []

unsubscribeFromFriendStatus :: Int -> Unit
unsubscribeFromFriendStatus id =  chatAPI ... "unsubscribeFromFriendStatus" $ args
  where args = PA.unshift id []
