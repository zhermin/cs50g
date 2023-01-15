# LÖVE & Unity Games

The base games were forked from [Harvard's CS50G](https://cs50.harvard.edu/games/2018/), which I built upon. Additional features specified by the assignment requirements or otherwise were implemented by me.

`make_love.bat` is a batch script written by me that builds the game into a Windows executable with the required DLL files.

## Assignment 0: Pong

__Objectives__

- Implement a basic AI for either Player 1 or 2 (or both!).

__Comments__

The AI used to determine where to move the paddle in anticipation of the ball's movement was rather challenging without any references. This is because we have to take into account the ball bouncing off the walls before reaching the paddle.

Thankfully I managed to find a method that essentially treats the ball's trajectory as a continuous straight line, even through the walls, and then performing modulo arithmetic to get the final position based on the ball's starting position, which must be saved at the moment the ball bounces off the paddle.

I then made both paddles AI-controlled because it's more fun :D

[Reference](https://stackoverflow.com/a/68535832/10928890)

## Assignment 1: Flappy Bird

__Objectives__

- Influence the generation of pipes so as to bring about more complicated level generation.
- Give the player a medal for their performance, along with their score.
- Implement a pause feature, just in case life gets in the way of jumping through pipes!

__Comments__

The first two objectives were easy. The pause function was a lot harder because the current game state had to be saved and then restored when the game is unpaused, which I naively thought could be done by just pausing the update loop.

However, because of how the state machine is set up, pausing the update loop and unpausing the update loop caused the game state to be reset (when `scrolling` is set to `true`).

Again, thanks to some searching, I managed to resolve this by passing around the game state using their predefined State Machine class's `change` function, which takes in a table of parameters to be passed to the next state. This table will then be in an input `params` variable to the `enter` function of the next state.

Week 2's video mentioned this is basically the same as React's state management and prop drilling; quite a nice tie-in.

[Reference](https://www.reddit.com/r/cs50/comments/h9fdni/cs50_game_dev_assignment_1_flappy_bird_pause_state/)

## Assignment 2: Breakout

__Objectives__

- Add a powerup to the game that spawns two extra `Ball`s.
- Grow and shrink the `Paddle` when the player gains enough points or loses a life.
- Add a locked `Brick` that will only open when the player collects a second new powerup, a key, which should only spawn when such a `Brick` exists and randomly as per the `Ball` powerup.
