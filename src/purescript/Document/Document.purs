module Document where

import Effect (Effect)
import Data.Unit (Unit)

foreign import setDocumentTitle :: String -> Effect Unit
