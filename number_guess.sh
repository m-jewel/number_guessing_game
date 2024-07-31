#!/bin/bash

# Set the PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Create the database if it does not exist
DB_EXISTS=$(psql --username=freecodecamp --dbname=postgres -t --no-align -c "SELECT 1 FROM pg_database WHERE datname='number_guess'")
if [[ -z $DB_EXISTS ]]; then
  psql --username=freecodecamp --dbname=postgres <<EOF
  CREATE DATABASE number_guess;
EOF
fi

# Create the table if it does not exist
psql --username=freecodecamp --dbname=number_guess <<EOF
CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(22) UNIQUE,
  games_played INT DEFAULT 0,
  best_game INT DEFAULT NULL
);
EOF

# Function to get user details
get_user_details() {
  USERNAME=$1
  USER_DETAILS=$($PSQL "SELECT games_played, COALESCE(best_game, 0) FROM users WHERE username='$USERNAME'")
  echo $USER_DETAILS
}

# Function to insert new user
insert_new_user() {
  USERNAME=$1
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
}

# Function to update user stats
update_user_stats() {
  USERNAME=$1
  GAMES_PLAYED=$2
  BEST_GAME=$3
  $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'"
}

# Prompt for username
echo "Enter your username:"
read USERNAME

# Get user details
USER_DETAILS=$(get_user_details $USERNAME)

if [[ -z $USER_DETAILS ]]; then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  insert_new_user $USERNAME
  GAMES_PLAYED=0
  BEST_GAME=0
else
  # Existing user
  IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_DETAILS"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Random number generation
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

# Game loop
while true; do
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  # Validate the input
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    ((GAMES_PLAYED++))

    if [[ $BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      BEST_GAME=$NUMBER_OF_GUESSES
    fi

    update_user_stats $USERNAME $GAMES_PLAYED $BEST_GAME
    break
  fi
done
