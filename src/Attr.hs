module Attr (
    attr
  , grass
  , ground
  , obstacle
  , cloud
  , shortob
) where

import Brick (AttrMap, AttrName, attrMap, fg)
import Graphics.Vty (defAttr, green, yellow, red, white, blue)

grass, ground, obstacle, cloud, shortob :: AttrName
grass = "grass"
ground = "ground"
obstacle = "obstacle"
shortob = "shortob"
cloud = "cloud"

attr :: AttrMap
attr = attrMap defAttr [
        (grass, fg yellow)
      , (ground, fg red)
      , (obstacle, fg green)
      , (cloud, fg white)
      , (shortob, fg white)
    ]
