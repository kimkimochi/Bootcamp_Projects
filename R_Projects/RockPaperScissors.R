### Rock Paper Scissors (Pao Ying Chub)
  ### Users can play unlimited times
  ### Have summary when ending

### Guide
### 1. Start game
### 2. User choose their hand
### 3. Comp choose it's hand
### 4. Compares between hands of user vs. comp
### 5. Save result
### 6. Repeat until users don't wanna play
### 7. Show a summary

### Variables
### Hands
num_hands <- (1:3)
full_hands <- c("Rock", "Paper", "Scissors")
df_hands <- data.frame(Name = full_hands)

### Start
print("Welcome to Rock Paper Scissors game!")

count_start <- 0
while (count_start >= 0) {
  count_start <- count_start + 1
  print("Would you want to play? (Y/N)")
  start <- readLines("stdin", n=1)
  if (start == "Y") {
### Player's Turn
    print("--- Player's Turn : Choose your hand (1-3) ---")
    print(df_hands)
    player_hand <- (readLines("stdin", n=1))
    break

### Don't wanna play
  } else if (start == "N") {
    print("We will wait to see you next time ;(")
    q()
  } else {
    print("Wrong input, Please select again (Y/N)")
  }
}

### Check player choice
count_pturn <- 0
while (count_pturn >= 0) {
  count_pturn <- count_pturn + 1
  if (player_hand <= 3) {
    break
  } else if (is.numeric(player_hand) == FALSE ) {
    print("Wrong input, Please select again (1-3)")
    player_hand <- (readLines("stdin", n=1))
  } else {
    print("Wrong input, Please select again (1-3)")
    player_hand <- (readLines("stdin", n=1))
  }
}

player_hand <- as.numeric(player_hand)
print ( paste("You choose", full_hands[player_hand]) )

### Computer's Turn
print("--- Computer's Turn ---")
comp_hand <- sample(x=num_hands, size=1)
print ( paste("Computer choose", full_hands[comp_hand]))

### Analyze Result
win <- 0
draw <- 0
lose <- 0
if (player_hand == comp_hand) {
  print("--- Draw ---")
  draw <- draw + 1
} else if ((player_hand == 1) & (comp_hand == 2)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 1) & (comp_hand == 3)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else if ((player_hand == 2) & (comp_hand == 1)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else if ((player_hand == 2) & (comp_hand == 3)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 3) & (comp_hand == 1)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 3) & (comp_hand == 2)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else {
  print("Error")
  break
}




### Play again ?
count_ask_again <- 0
while (count_ask_again >= 0) {
count_ask_again + 1
count_again <- 0
while (count_again >= 0) {
  count_again <- count_again + 1
  print("Would you want to play again? (Y/N)")
  again <- readLines("stdin", n=1)
  if (again == "Y") {
### Player's Turn
    print("--- Player's Turn : Choose your hand (1-3) ---")
    print(df_hands)
    player_hand <- (readLines("stdin", n=1))
    break

### Don't wanna play again
  } else if (again == "N") {
    ### Show Result
    print("Results")
    print( paste("Win:", win) )
    print( paste("Draw:", draw) )
    print( paste("Lose:", lose) )
    print("Thank you for playing our game. <3")
    q()
    
  } else {
    print("Wrong input, Please select again (Y/N)")
  }
}

### Check player choice
count_pturn <- 0
while (count_pturn >= 0) {
  count_pturn <- count_pturn + 1
  if (player_hand <= 3) {
    break
  } else if (is.numeric(player_hand) == FALSE ) {
    print("Wrong input, Please select again (1-3)")
    player_hand <- (readLines("stdin", n=1))
  } else {
    print("Wrong input, Please select again (1-3)")
    player_hand <- (readLines("stdin", n=1))
  }
}

player_hand <- as.numeric(player_hand)
print ( paste("You choose", full_hands[player_hand]) )

### Computer's Turn
print("--- Computer's Turn ---")
comp_hand <- sample(x=num_hands, size=1)
print ( paste("Computer choose", full_hands[comp_hand]))

### Analyze Result
if (player_hand == comp_hand) {
  print("--- Draw ---")
  draw <- draw + 1
} else if ((player_hand == 1) & (comp_hand == 2)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 1) & (comp_hand == 3)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else if ((player_hand == 2) & (comp_hand == 1)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else if ((player_hand == 2) & (comp_hand == 3)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 3) & (comp_hand == 1)) {
  print("--- You lose... ---")
  lose <- lose + 1
} else if ((player_hand == 3) & (comp_hand == 2)) {
  print("--- Congrats, You win! ---")
  win <- win + 1
} else {
  print("Error")
}


}


### Show Result
print("Results")
print( paste("Win:", win) )
print( paste("Draw:", draw) )
print( paste("Lose:", lose) )
print("Thank you for playing our game. <3")
q()
