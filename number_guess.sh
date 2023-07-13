#!/bin/bash
#GENERATE RANDOM NUMBER

SECRET=$[$RANDOM % 1000 + 1 ]
echo $SECRET
NUMBER_OF_GUESSES=0
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
#ADD FUNCTION GUESS
GUESS () {
#ECHOGUESS THE SECRET NUMBER BETWEEN 1 AND 1000

read GUESS 
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo That is not an integer, guess again:
  GUESS
fi
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
if [[ $GUESS = $SECRET ]]
then
  if [[ -z $CHECK_USERNAME ]]
  then 
  ADD_DATA=$($PSQL "INSERT INTO datas(username,games_played,best_game) VALUES('$USERNAME',1,$NUMBER_OF_GUESSES) ")
  else
    ADD_DATA=$($PSQL "UPDATE datas SET games_played=games_played+1 WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM datas WHERE username='$USERNAME' ;")
    if (( $NUMBER_OF_GUESSES > $BEST_GAME ))
    then
    UPDATE_DATA=$($PSQL "UPDATE datas SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
    fi
  fi
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET. Nice job!"
  exit
else
  if (( $GUESS > $SECRET ))
  then
    echo "It's lower than that, guess again:"

    GUESS
  else
    echo "It's higher than that, guess again:"
    GUESS
  fi
fi
}

echo -e "Enter your username:"
read USERNAME
#CHECK USERNAME
CHECK_USERNAME=$($PSQL "SELECT username FROM datas WHERE username='$USERNAME';")
if [[ -z $CHECK_USERNAME ]]
then 
  echo Welcome, $USERNAME! It looks like this is your first time here. 
else
  CHECK_FULL=$($PSQL "SELECT games_played,best_game FROM datas WHERE username='$USERNAME' ")
  echo $CHECK_FULL | while read GAMES_PLAYED BAR BEST_GAME
  do
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done
fi
echo Guess the secret number between 1 and 1000:
GUESS

#IF ZERO
#ECHO Welcome, <username>! It looks like this is your first time here.

#ELSE 
#READ GAMES_PLAYED +BEST GAME 
#ECHO Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
