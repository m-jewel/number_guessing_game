#!/bin/bash

# Set the PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Randomly generate a number 1-1000
NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

# Declare number of guesses variable so it's global
NUMBER_OF_GUESSES=0

MAIN_MENU() {
  # Ask for username
  echo -e "\nEnter your username:"
  read USERNAME

  # Search the database for the username given
  USERNAME_SEARCH=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

  # If username not in database
  if [[ -z $USERNAME_SEARCH ]]; then
    # Print "Welcome, <username>! It looks like this is your first time here."
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    # Input user into database
    USER_INPUT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  else
    # If user in database
    # Print "Welcome back, <username>! You have played <games_play> games, and your best game took <best_game> guesses."
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  # Print "Guess the secret number between 1 and 1000:"
  echo -e "\nGuess the secret number between 1 and 1000:"
  GAME
}

GAME() {
  # Read input
  read GUESS

  # If not an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    # Print "That is not an integer, guess again:"
    echo -e "\nThat is not an integer, guess again:"
    GAME
  else
    if [[ $GUESS -gt $NUMBER ]]; then
      # Increment guess counter
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
      # If user input is higher then print "It's lower than that, guess again:"
      echo -e "\nIt's lower than that, guess again:"
      # Redirect to top of function
      GAME

    elif [[ $GUESS -lt $NUMBER ]]; then
      # Increment guess counter
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
      # Elif user input is lower then print "It's higher than that, guess again:"
      echo -e "\nIt's higher than that, guess again:"
      # Redirect to top of function
      GAME

    elif [[ $GUESS -eq $NUMBER ]]; then
      # Increment guess counter
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
      # Update database
      # Increment games played in database for <username>
      INCREMENT_GAME_COUNTER=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")
      
      # Update best game if number of guesses is < best_game figure
      if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
      fi

      # Print "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    fi
  fi
}

# Create the database if it does not exist
DB_EXISTS=$(psql --username=freecodecamp --dbname=postgres -t --no-align -c "SELECT 1 FROM pg_database WHERE datname='number_guess'")
if [[ -z $DB_EXISTS ]]; then
  psql --username=freecodecamp --dbname=postgres -c "CREATE DATABASE number_guess;" &> /dev/null
fi

# Create the table if it does not exist
psql --username=freecodecamp --dbname=number_guess -c "CREATE TABLE IF NOT EXISTS users (username VARCHAR(22) UNIQUE, games_played INT DEFAULT 0, best_game INT DEFAULT NULL);" &> /dev/null

# Call the main menu function
MAIN_MENU
