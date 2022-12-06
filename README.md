# 230project
A Haskell programmed Chrome dino game.<br>
The game's idea is based on the idea of the popular dino game on Chrome web browser. We would like to implement it in Haskell and add more interesting functions.<br>

## Libraries
The project is implemented using this library. https://github.com/jtdaugherty/brick/

## Game
The game runs as follows:<br>
(1) type in 'runner 10' in the command line, where the number '10' represents your moving speed
(2) use 'space' to jump, use 'q' to quit, use 'ENTER' to restart the game. <br>


## Milestone 3
### Architectures
Main functions include:<br>
(1) Actions: jump, collision with obstacles<br>
(2) Attr: elements in the game, for example, grass, obstacles<br>
(3) Draw: draw the little dinosaur<br>
(4) Game: game elements such as moving speed, starts playing<br>
(5) Loop: forever runs the game if the player doesn't fail<br>
(6) Types: define the elements in the game<br>
(7) Windows: the framework of game<br>

### Challenges
(1) How to create the collision function. We are struggling on how to judge the collision conditions and how to produce results for collisions.<br>
(2) We are thinking about double jumps. But we haven't figure out how to avoid continuous double jumps which will be so unbalanaced.<br>
(3) We are thinking out creating floating platforms that the dinosaur can jump onto. But we don't know how to create platforms that the dinosaur can land on.<br>
(4) We are thinking about randomly generating various obstacles, but haven't experiment on it yet.<br>
(5) Our dinosaur now moves in a constant speed. We expect to increase its speed as time moves on.<br>

### Deadline
We believe we can meet our goal at the deadline. We are meeting every three days to try to finish this project ahead of time. And we will consult TAs when we have any question.

## Installation
To run the game, first run the command `stack run` in terminal in the 230project directory.<br>
To start the game, run the command `stack exec runner 30` in terminal where `30` is the speed that can be any number from 10 to infinite.<br>
