{-# LANGUAGE DeriveDataTypeable #-}

module Reflex.Polymer.Xhr.Exception where

import Data.Typeable
import Control.Exception (Exception(..))

data XhrException = XhrException_Error
                  | XhrException_Aborted
     deriving (Show, Read, Eq, Ord, Typeable)

instance Exception XhrException
