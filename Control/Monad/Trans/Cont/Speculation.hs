-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Monad.Trans.Cont.Speculation
-- Copyright   :  (C) 2011 Edward Kmett, Jake McArthur
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  Edward Kmett <ekmett@gmail.com>
-- Stability   :  provisional
-- Portability :  portable
--
----------------------------------------------------------------------------
module Control.Monad.Trans.Cont.Speculation where

import Control.Monad.Trans.Cont
import qualified Control.Concurrent.Speculation as Prim
import Control.Concurrent.STM

spec :: Eq a => a -> a -> Cont r a
spec g a = cont $ \k -> Prim.spec g k a 

spec' :: Eq a => a -> a -> Cont r a
spec' g a = cont $ \k -> Prim.spec' g k a

specBy :: (a -> a -> Bool) -> a -> a -> Cont r a
specBy f g a = cont $ \k -> Prim.specBy f g k a

specBy' :: (a -> a -> Bool) -> a -> a -> Cont r a
specBy' f g a = cont $ \k -> Prim.specBy' f g k a

specOn :: Eq c => (a -> c) -> a -> a -> Cont r a
specOn f g a = cont $ \k -> Prim.specOn f g k a

specOn' :: Eq c => (a -> c) -> a -> a -> Cont r a
specOn' f g a = cont $ \k -> Prim.specOn' f g k a

specSTM :: Eq a => STM a -> a -> ContT r STM a
specSTM g a = ContT $ \k -> Prim.specSTM g k a 

specSTM' :: Eq a => STM a -> a -> ContT r STM a
specSTM' g a = ContT $ \k -> Prim.specSTM' g k a 

specOnSTM :: Eq c => (a -> STM c) -> STM a -> a -> ContT r STM a
specOnSTM f g a = ContT $ \k -> Prim.specOnSTM f g k a 

specOnSTM' :: Eq c => (a -> STM c) -> STM a -> a -> ContT r STM a
specOnSTM' f g a = ContT $ \k -> Prim.specOnSTM' f g k a 

specBySTM :: (a -> a -> STM Bool) -> STM a -> a -> ContT r STM a
specBySTM f g a = ContT $ \k -> Prim.specBySTM f g k a 

specBySTM' :: (a -> a -> STM Bool) -> STM a -> a -> ContT r STM a
specBySTM' f g a = ContT $ \k -> Prim.specBySTM' f g k a 
