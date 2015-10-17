module Optic.Refractor.Prism.Coproduct
  ( _CLeft
  , _CRight
  ) where

import Prelude (($), (<<<))

import Data.Functor.Coproduct (Coproduct(), coproduct, left, right)
import Data.Either (Either(..))

import Optic.Prism (prism)
import Optic.Types (Prism())

_CLeft :: forall f g h a. Prism (Coproduct f h a) (Coproduct g h a) (f a) (g a)
_CLeft = prism left $ coproduct Right (Left <<< right)

_CRight :: forall f g h a. Prism (Coproduct f g a) (Coproduct f h a) (g a) (h a)
_CRight = prism right $ coproduct (Left <<< left) Right
