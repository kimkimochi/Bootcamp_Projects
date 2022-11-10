## Home work 01

### Chatbot (rule-based)
### ordering pizza

### Variable
menus <- c("Hawaiian",
          "Seafood Deluxe",
          "Peperoni",
          "Chicken BBQ",
          "Super Supreme",
          "Blue Sky"
         )
sizes <- c("(S)", "(M)", "(L)")
s_prices <- c(200, 400, 300, 350, 450, 1500)
m_prices <- s_prices * 1.2
l_prices <- s_prices * 1.5
prices_list <- list(S = s_prices,
                   M = m_prices,
                   L = l_prices)


### Welcome Message
print("Welcome to Los Pollos Hermanos Pizzeria")
print("Where something delicious is always cooking!")
print(" ")
print("Hello There!")

### Question 01
### Customer Name
print("What's your name?: ")
user_name <- readLines("stdin", n=1)
print( paste("Hi", user_name) )

### Question 02
### Customer Action
print("How we can help you? (1-2)")
print("1. Order pizza, 2. Feedback / Report a problems")
action <- readLines("stdin", n=1)

count_action <- 0
while (count_action >= 0) {
count_action + 1
### if action
if (action == 1) {
  print("You choose order pizza.")
  
  ### Question 03
  ### Member Card
  count_membercard <- 0
  while (count_membercard >= 0) {
  count_membercard + 1
    
  print("Do you have member card? (Y/N)")
  member <- readLines("stdin", n=1)

  ### if have membercard
  if (member == "Y") {
    print("Please enter your member card number.")
    member_num <- as.numeric(readLines("stdin", n=1))
    print( paste("Welcome back", user_name) )
    break
    
  ### if not have member card
  } else if (member == "N") {
    count_regis <- 0
    while (count_regis >= 0) {
      count_regis + 1
      print("Do you want to register membership? (Y/N)")
      regis_mem <- readLines("stdin", n=1)
      ### if want to register
      if (regis_mem == "Y") {
        print("Please enter your Firstname")
        regis_firstname <- readLines("stdin", n=1)
        print("Please enter your Lastname")
        regis_lastname <- readLines("stdin", n=1)
        print("Please enter your Email")
        regis_email <- readLines("stdin", n=1)
        print("Please enter your DOB (YYYY-MM-DD)")
        regis_dob <- readLines("stdin", n=1)
        print("Successfully Registered!")
        print( paste("Welcome", regis_firstname) )
        member_num <- sample.int(1000000:9999999, 1)
        print( paste("Your member number is:", member_num) )
        break
          
      ### if dont want to register
      } else if (regis_mem == "N") {
        member_num <- 0
        break
        
      } else {
        print("Wrong input, Please select again (Y/N)")
      }
    }
break
      
  } else {
    print("Wrong input, Please select again (Y/N)")
  }
  }

  ### Question 04
  ### Orders Pizza
  count_menu <- 0
  while (count_menu >= 0) {
    count_menu + 1
    print("What do you want to orders today? (1-6)")
    df_menus <- data.frame(Menus = menus,
                          S = s_prices,
                          M = m_prices,
                          L = l_prices)
    print(df_menus)
    menu_order <- (readLines("stdin", n=1))
    if (menu_order >= 1 & menu_order <= 6) {
      break
    } else {
      print("Wrong input, Please select again (1-6)")
    }
  }
  menu_order <- as.numeric(menu_order)
  
  ### Question 05
  ### Pizza Size
  count_size <- 0
  while (count_size >= 0) {
    count_size + 1
    print("What pizza size would you want? (1-3)")
    print("1.(S)  2.(M)  3.(L)")
    size <- (readLines("stdin", n=1))
    if (size >= 1 & size <= 3) {
      break
    } else {
      print("Wrong input, Please select again (1-3)")
    }
  }
  size <- as.numeric(size)

  ### Question 06
  ### Amount of pizza
  count_amount <- 0
  while (count_amount >= 0) {
    count_amount + 1
    print( paste("How many", menus[menu_order], sizes[size], "do you want? (0-99)") )
    pizza_amount <- (readLines("stdin", n=1))
    if (pizza_amount >= 01 & pizza_amount <= 99) {
      break
    } else if (pizza_amount == 0) {
      print("Canceling order...")
      q()
    } else {
      print("Wrong input, Please select again")
    }
  }
  pizza_amount <- as.numeric(pizza_amount)

  ### Question 07
  ### Member Discount
  ### Have a membership
  if (member_num != 0) {
    print("You receive 10 % discount from member card!")
    discount <- 0.90
  ### Not have membership
  } else {
      print("You don't have a membership, Then you will not receive a discount!")
    count_regis_dis <- 0
    while (count_regis_dis >= 0) {
      count_regis_dis + 1
      print("Do you want to register membership? (Y/N)")
      regis_mem <- readLines("stdin", n=1)
      ### if want to register
      if (regis_mem == "Y") {
        print("Please enter your Firstname")
        regis_firstname <- readLines("stdin", n=1)
        print("Please enter your Lastname")
        regis_lastname <- readLines("stdin", n=1)
        print("Please enter your Email")
        regis_email <- readLines("stdin", n=1)
        print("Please enter your DOB (YYYY-MM-DD)")
        regis_dob <- readLines("stdin", n=1)
        print("Successfully Registered!")
        print( paste("Welcome", regis_firstname) )
        member_num <- sample.int(1000000:9999999, 1)
        print( paste("Your member number is:", member_num) )
        discount <- 0.90
        break
  
      ### if dont want to register
      } else if (regis_mem == "N") {
        member_num <- 0
        discount <- 1
        break
      } else {
        print("Wrong input, Please select again (Y/N)")
      }
    }
  }

  ### Question 08
  ### Payment method
  count_pay <- 0
  while (count_pay >= 0) {
    count_pay + 1
    print("Please select payment method (1-2)")
    print("1. Cash, 2. Credit Card")
    payment <- (readLines("stdin", n=1))
    if (payment >= 1 & payment <= 2) {
      break
    } else {
      print("Wrong input, Please select again (1-2)")
    }
  }
  payment <- as.numeric(payment)
  
  ### Question 09
  ### Order Summary
  print("***** Your order summary: *****")
  print( paste(menus[menu_order], sizes[size], "*", pizza_amount) )
    if(size == "1") {
      member_sum <- (prices_list$S[menu_order] * pizza_amount) * discount
    } else {
      if(size == "2") {
        member_sum <- (prices_list$M[menu_order] * pizza_amount) * discount
      } else {
        member_sum <- (prices_list$L[menu_order] * pizza_amount) * discount
      } 
    }

    if(member_num != 0) {
      print("Discount: 10%")
    } else {
      print("Discount: -")
    }
  
    if(payment == 1) {
      print("Payment method: Cash")
    } else {
      print("Payment method: Credit Card")
    }
  
  print( paste("Total:", member_sum, "$") )
  print("----- Thank you for your order! -----")
  print("We hope you will happy at Los Pollos Hermanos, where something delicious is always cooking!")
  q()
  
  
} else if (action == 2) {
  ### Question 10
  ### Customer Feedback
  count_feedback <- 0
  while (count_feedback >= 0) {
    count_feedback + 1
    
    print ("1. Feedback, 2. I have a problems")
    feedback <- readLines("stdin", n=1)
      
    if (feedback == 1) {
      count_rate <- 0
      while (count_rate >= 0) {
        count_rate + 1
        print("Please rate us from 1 to 5")
        rate <- readLines("stdin", n=1)
        if (rate >= 1 & rate <= 5) {
          print( paste("Additional comment. Please tell us why you give", rate) )
        break
        } else {
          print("Wrong input, Please select again (1-5)")
        }
      }
      comment <- readLines("stdin", n=1)
      print("Thank you for your feedback, Your comments will be taken to improve our store.")
      q()
    } else if (feedback == 2) {
      print("Please tell us about your problem.")
      problem<- readLines("stdin", n=1)
      print("We regret any inconvenience, Your comments will be taken to improve our store. Thank you for your comment.")
      q()
    } else {
      print("Wrong input, Please select again (1-2)") 
    }
  }
} else {
  print("Wrong input, Please select again (1-2)")
  action <- readLines("stdin", n=1)
}
}
