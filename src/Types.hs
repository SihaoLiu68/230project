{-# LANGUAGE TemplateHaskell #-}
module Types (
    UI
  , Tick(..)
  , Direction(..)
  , State(..)
  , Player
  , Obstacles
  , Shortobs
  , shortobs
  , Clouds
  , clouds
  , Name
  , create
  , reset
  , position
  , dimensions
  , player
  , obstacles
  , state
  , speed
) where

import ClassyPrelude

import Control.Lens ((&), (^.), (.~), makeLenses)

import Window (Dimensions)

data Direction = Up | Down | Level
type Player = (Direction, Int)
type Obstacles = [Int]
type Clouds = [Int]
type Shortobs = [Int]
data State = Playing | GameOver

data UI = UI {
    _position :: Float
  , _dimensions :: Dimensions
  , _player :: Player
  , _obstacles :: [Int]
  , _clouds :: [Int]
  , _shortobs :: [Int]
  , _state :: State
  , _speed :: Int
}

$(makeLenses ''UI)

create :: Dimensions -> Int -> UI
create s sp = UI {
        _position = 0
      , _dimensions = s
      , _player = (Level, 0)
      , _obstacles = [fst s]
      , _clouds = [fst s]
      , _shortobs = [fst s]
      , _state = Playing
      , _speed = sp
    }

reset :: UI -> UI
reset ui = ui
    & state .~ Playing
    & player .~ (Level, 0)
    & obstacles .~ [fst s]
    & clouds .~ [fst s]
    & shortobs .~ [fst s]
    & position .~ 0
    where s = ui ^. dimensions

data Tick = Tick
type Name = ()
