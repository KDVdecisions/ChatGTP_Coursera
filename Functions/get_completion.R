# ChatGPT Prompt Engineering for Developers
# DeepLeraning.AI course
# 
# Unit: Guidelines

# Chat completion helper function

#######################
# Python version
# def get_completion(prompt, model="gpt-3.5-turbo"):
#   messages = [{"role": "user", "content": prompt}]
#   response = openai.ChatCompletion.create(
#     model=model,
#     messages=messages,
#     temperature=0, # this is the degree of randomness of the model's output
#   )
#   return response.choices[0].message["content"]
########################

library(openai)

get_completion <- function(prompt, model = "gpt-3.5-turbo", temp = 0) {
    messages <- list(list("role" = "user", "content" = prompt))
    response <- openai::create_chat_completion(model = model, messages = messages, temperature = temp)
    return(response$choices$message.content)
  }

# EXAMPLE:
# model <- "gpt-3.5-turbo"
# prompt <- "Generate a list of three made-up book titles along with their authors and genres. Provide them in JSON format with the following keys:book_id, title, author, genre."
# 
# answer <- get_completion(prompt = prompt, model = model)

