# Building Systems with the ChatGPT API
# DeepLeraning.AI course
# 
# Unit: Language Models and the Chat Format

# Helper function to demonstrate assignment of more complex messages


#######################
# Python version
# def get_completion_and_token_count(messages, 
#                              model="gpt-3.5-turbo", 
#                              temperature=0, 
#                              max_tokens=500):
#   response = openai.ChatCompletion.create(
#     model=model,
#     messages=messages,
#     temperature=temperature, # this is the degree of randomness of the model's output
#     max_tokens=max_tokens, # the maximum number of tokens the model can ouptut 
#   )
#   return response.choices[0].message["content"]
#######################
  
get_completion_from_messages <- function(messages, model = "gpt-3.5-turbo", temp = 0, max_tokens = 500) {
  messages <- messages
  response <- openai::create_chat_completion(model = model, 
                                             messages = messages, 
                                             temperature = temp,
                                             max_tokens = max_tokens)
  return(response$choices$message.content)
}

# EXAMPLE:
# messages =  list(
#   list("role" = "system", 
#        "content" = "You are an assistant who responds in the style of Dr. Seuss"),
#   list("role" = "user", 
#        "content" = "Write me a very short poem about a happy carrot.")
#   )
#  
# response = get_completion_from_messages(messages, temp = 1)
# print(response)
