# -*- coding: utf-8 -*-
"""
Created on Fri Nov 13 12:03:11 2020

@author: chrambo
"""

# =============================================================================
# One Player Tic-Tac-Toe Game
# =============================================================================

import random

#%%Build the board

#Create board dictionary
gameBoard = {'1': ' ' , '2': ' ' , '3': ' ' ,
            '4': ' ' , '5': ' ' , '6': ' ' ,
            '7': ' ' , '8': ' ' , '9': ' ' }

#Will be printing the board a lot so set up a function
printBoard = lambda board:(
    print(' ' + board['1'] + '| ' + board['2'] + ' | ' + board['3'],
          '\n--+---+--\n', 
          board['4'] + '| ' + board['5'] + ' | ' + board['6'], 
          '\n--+---+--\n', 
          board['7'] + '| ' + board['8'] + ' | ' + board['9']))

board = []

for place in gameBoard:
    board.append(place) #Clear the board

#%%Introduce the game
print('Welcome to the game of Tic-Tac-Toe, you are playing as X and will go first \n',
      'The board is stuctured like')

print(' ' + '1' + '| ' + '2' + ' | ' + '3',
          '\n--+---+--\n', 
          '4' + '| ' + '5' + ' | ' + '6', 
          '\n--+---+--\n', 
          '7' + '| ' + '8' + ' | ' + '9')

print('Unfortunately for you I am a lazy programmer so even if a board will result in a tie, \n'
      'you will have to play to the end. Best of five wins! Good luck.\n')

#%% Play the game (I lost the game!)

#Starting conditions
playerScore = 0
comScore = 0
player = 'X'
turns = 0
play = True

while (playerScore or comScore) < 3:              

    if player == 'X': #Player takes their turn with keyboard input
        play = str(input('It\'s your turn. Where do you want to play? '))  
        if gameBoard[play] == ' ': #Location must be empty
            gameBoard[play] = 'X' #Location is recorded for the player
            turns += 1
        else:
            print('That place is already taken. Please try another location')
            continue
    
    if player == 'O': #Computer Takes its turn randomly
        play = str(random.randint(1,9))
        if gameBoard[play] == ' ': #Location must be empty
            gameBoard[play] = 'O' #Location is recorded for the computer
            turns += 1 #Tie condition increases
            print('The computer has played.')
        else:
            continue
        
    printBoard(gameBoard)
    # Check if any win conditions are met
    if     (gameBoard['1'] == gameBoard['2'] == gameBoard['3'] != ' ') or (# Top 
            gameBoard['4'] == gameBoard['5'] == gameBoard['6'] != ' ') or (# Middle
            gameBoard['7'] == gameBoard['8'] == gameBoard['9'] != ' ') or (# Bottom
            gameBoard['1'] == gameBoard['4'] == gameBoard['7'] != ' ') or (# Left
            gameBoard['2'] == gameBoard['5'] == gameBoard['8'] != ' ') or (# Middle
            gameBoard['3'] == gameBoard['6'] == gameBoard['9'] != ' ') or (# Right
            gameBoard['1'] == gameBoard['5'] == gameBoard['9'] != ' ') or (# /
            gameBoard['7'] == gameBoard['5'] == gameBoard['3'] != ' '):    # \ 
        print("\nRound over.")                
        print(player + " has won the round!")
        if player =='X':
            playerScore += 1 #Record player win
        else:
            comScore += 1 #Record computer win
        for place in board:
            gameBoard[place] = " " #Clear the board, reset turns
        turns = 0
        #Give the scores
        print('Your score is ' + str(playerScore) +
              ' the computer\'s score is ' + str(comScore) +".\n")
    # Check if tie condition has been met
    if turns == 9:
        print("It's a tie, please start again.\n")
        for place in board:
            gameBoard[place] = " " #Clear the board, reset turns
        turns = 0
        print('A new round starts now.')

    # Change players
    if player =='X':
        player = 'O'
    else:
        player = 'X'        
    

    #Check scores/restart
    if playerScore == 3:
        restart = input('You have won the game! Would you like to start again? (y/n)')
        if restart == "y" or restart == "Y":  
            playerScore = 0 #Set up new game
            comScore = 0
            player = 'X'
        else:
            break
    elif comScore == 3:
        restart = input('Game Over. You have lost. Would you like to start again? (y/n)')
        if restart == "y" or restart == "Y":  
            playerScore = 0 #Set up new game
            comScore = 0
            player = 'X'
        else:
            break