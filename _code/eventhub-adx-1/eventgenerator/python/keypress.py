# from pynput.keyboard import Key, Listener


while(True):
  
    user_input = input(" Please enter Y to publish, N to exit: ")
      
    if user_input == "Y":
        print("Publish")
        
  
    elif user_input == "N":
        break
  
    else:
        print("Enter either Y or N")

