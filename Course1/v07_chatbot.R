# Ashton Drew
# OpenAI Course Notes 
# November 2023

library(openai)

source("Functions/get_completion.R")
source("Functions/get_completion_from_messages.R")

# Basic Chatbot ----

 # - system is a general instruction to set persona & behaviour
 # - then define user and assistant (ai) roles

messages =  list(
  list(role = "system",
       content = "You are an assistant that speaks like Shakespeare."),
  list(role = "user",
       content = "Tell me a joke."),
  list(role = "assistant",
       content = "Why did the chicken cross the road?"),   
  list(role = "user",
       content = "I don\'t know")
)

response = get_completion_from_messages(messages, temp = 0.2)
cat(response)

# Greeting
messages =  list(
  list(role = "system",
       content = "You are a friendly chatbot."),
  list(role = "user",
       content = "Hi, my name is Isa")
)
response = get_completion_from_messages(messages, temp=1)
cat(response)

# Each conversation is a unique event - the model does not know the 
# previous conversation
messages =  list(
  list(role = "system",
       content = "You are a friendly chatbot."),
  list(role = "user",
       content = "Can you remind me, what is my name?")
)
response = get_completion_from_messages(messages, temp=1)
print(response)

# It only retains information provided within the given chat context
messages =  list(
  list(role = "system",
       content = "You are a friendly chatbot."),
  list(role = "user",
       content = "Hi, my name is Isa"),
  list(role = "assistant",
       content = "Hi Isa! It's nice to meet you. Is there anything I can help you with today?"),  
  list(role = "user",
       content = "Yes, can you remind me, what is my name?")
)
response = get_completion_from_messages(messages, temp=1)
print(response)

# Pizza Order Bot ----

library(shiny)

context = list(
  list(role = "system", 
       content = "You are OrderBot, an automated service to collect orders for a pizza restaurant. \
You first greet the customer, then collects the order, \
and then asks if it's a pickup or delivery. \
You wait to collect the entire order, then summarize it and check for a final \
time if the customer wants to add anything else. \
If it's a delivery, you ask for an address. \
Finally you collect the payment.\
Make sure to clarify all options, extras and sizes to uniquely \
identify the item from the menu.\
You respond in a short, very conversational friendly style. \
The menu includes \
pepperoni pizza  12.95, 10.00, 7.00 \
cheese pizza   10.95, 9.25, 6.50 \
eggplant pizza   11.95, 9.75, 6.75 \
fries 4.50, 3.50 \
greek salad 7.25 \
Toppings: \
extra cheese 2.00, \
mushrooms 1.50 \
sausage 3.00 \
canadian bacon 3.50 \
AI sauce 1.50 \
peppers 1.00 \
Drinks: \
coke 3.00, 2.00, 1.00 \
sprite 3.00, 2.00, 1.00 \
bottled water 5.00")
)

shiny_get_completion_from_messages <- function(messages, model = "gpt-3.5-turbo", temp = 0, max_tokens = 500) {
  messages <- messages
  response <- openai::create_chat_completion(model = model, 
                                             messages = messages, 
                                             temperature = temp,
                                             max_tokens = max_tokens)
  return(response$choices$message.content)
}

shinyApp(
  ui = fluidPage(
    textInput("user", label = "Pizza Order Bot", value = "Enter your chat text here..."),
    actionButton("submit", label = "Submit!"),
    tableOutput("dialog_table")
  ),
  
  server = function(input, output) {
    
    grow_context <- reactiveValues(
      context = context
    )
    
    grow_dialog <- reactiveValues(
      dialog = data.frame(Speaker = "AI Assistant",
                           Text = "Hello! Welcome to our pizza restaurant.  What can I get you today?")
    )
    
    observeEvent(input$submit, {
      prompt <- input$user
      
      # Updates with user text
      new_context_user <- list(role = "user", content = prompt)
      grow_context$context <- append(grow_context$context, list(new_context_user))
      new_df_user <- data.frame(Speaker = "User", Text = prompt)
      grow_dialog$dialog <- rbind(grow_dialog$dialog, new_df_user)
      
      # Update with bot reply
      response <- shiny_get_completion_from_messages(messages = grow_context$context)
      new_context_bot <- list(role = "assistant", content = response)
      grow_context$context <- append(grow_context$context, list(new_context_bot))
      new_df_bot <- data.frame(Speaker = "AI Assistant", Text = response)
      grow_dialog$dialog <- rbind(grow_dialog$dialog, new_df_bot)
      
    })

    output$dialog_table <- renderTable({
      grow_dialog$dialog
    })
  }
)

