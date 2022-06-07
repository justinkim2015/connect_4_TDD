# connect_4_TDD

This is my first attempt at TDD.  This game seems pretty doable normally, however TDD is new to me so I feel the challenge here will be in using RSPEC to test for the things I need to do.  

PSEUDOCODE/BRAINSTORMING

First of all I need to make a board, a connect 4 board is 7 units wide and 6 units high (7 x 6 grid, 42 spaces)

  -What is the best way to represent this board?
    Possibly a 2D array.  

  -What data do I have to know about every spot?
    what color the spot is, red, yellow or unclaimed and it needs to know where it is located, coordinates.
  
  -How do I represent the board in terminal and update it?
    draw it with | and --- and so on.  I probably need to write a loop that will do it as many times as I need to represent the board, but since it has to have an X and Y axis I need to figure that out too.  
    
Secondly I need to make two players, these players will 'remember' their names and what color they are (red, yellow).  They should ask for this information from the players on init.  

Finally I need to create the game logic.