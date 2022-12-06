module Draw (draw) where

import ClassyPrelude

import Control.Lens ((^.))

import Data.Sequence ((!?))

import Brick (Widget, AttrName, Padding(Pad), vBox, txt, str, withAttr, padTop, padBottom, padLeft, emptyWidget)
import Brick.Widgets.Center (center)

import Attr (grass, ground, obstacle, cloud, shortob)
import Types (Name, UI, Obstacles, Shortobs, shortobs, Clouds, clouds, State(..), Direction(Level), dimensions, position, player, obstacles, state)

makeRow :: Int -> AttrName -> Char -> Widget Name
makeRow screenWidth attr char = withAttr attr . str $ const char <$> [1 .. screenWidth]

drawObstacle :: Obstacles -> Int -> Char
drawObstacle obs i = if i `elem` obs then 'T' else ' '

drawObstacles :: Obstacles -> Int -> Int -> Widget Name
drawObstacles obs pos screenWidth = withAttr obstacle . str $ drawObstacle obs <$> [pos .. screenWidth + pos]

drawCloud :: Clouds -> Int -> Char
drawCloud obs i = if i `elem` obs then '@' else ' '

drawClouds :: Clouds -> Int -> Int -> Widget Name 
drawClouds obs pos screenWidth = withAttr cloud . str $ drawCloud obs <$> [pos .. screenWidth + pos]

drawShortobs :: Shortobs -> Int -> Char 
drawShortobs obs i = if i `elem` obs then '~' else ' '

drawShortobss :: Shortobs -> Int -> Int -> Widget Name 
drawShortobss obs pos screenWidth = withAttr shortob . str $ drawShortobs obs <$> [pos .. screenWidth + pos]


legs :: Seq Text
legs = fromList [
        "/\\ /\\"
      , "// /\\"
      , "// //"
      , "/\\ //"
      , "\\\\ /\\"
    ]

drawLegs :: Direction -> Int -> Text
drawLegs jumping i = case jumping of
    Level -> fromMaybe "/\\ /\\" (legs !? ((i `div` 2) `mod` length legs))
    _ -> "\\/ \\/"

drawSprite :: UI -> Int -> Int -> Widget Name
drawSprite ui i h = padTop (Pad offset) $ padLeft (Pad 3) widget
    where (jumping, jump) = ui ^. player
          offset = h - 6 - jump
          widget = vBox [txt "    00", txt "\\ === ", txt "|====]", txt (drawLegs jumping i)]

drawGameOver :: UI -> Widget Name
drawGameOver ui = case ui ^. state of
    GameOver -> center . vBox $ txt <$> [
            "    GAME OVER    "
          , "Press Enter to retry"
        ]
    Playing -> emptyWidget

draw :: UI -> [Widget Name]
draw ui = [
        score
      , drawGameOver ui
      , drawSprite ui i' h
      , padTop (Pad (h - 20)) (vBox upper)
      , padTop (Pad (h - 10)) (vBox shorter)
      , padTop (Pad (h - 4)) (vBox rows)
      

    ]

    where i = ui ^. position
          i' = floor i :: Int
          obs = ui ^. obstacles
          clds = ui ^. clouds
          sho = ui ^. shortobs
          (w, h) = ui ^. dimensions
          score = str $ "Score: " ++ show i'
          upper = [drawClouds clds i' w]
          
          rows = [drawObstacles obs i' w, makeRow w grass 'w', makeRow w ground 'X']
          shorter = [drawShortobss sho i' w]
          

