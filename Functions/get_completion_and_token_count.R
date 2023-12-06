# Building Systems with the ChatGPT API
# DeepLearning.AI course
# 
# Unit: Language Models and the Chat Format

# Helper function to return tokens used in request and responses

#######################
# Python version
# def get_completion_and_token_count(messages, 
#                                    model="gpt-3.5-turbo", 
#                                    temperature=0, 
#                                    max_tokens=500):
#   
#   response = openai.ChatCompletion.create(
#     model=model,
#     messages=messages,
#     temperature=temperature, 
#     max_tokens=max_tokens,
#   )
#   
#   content = response.choices[0].message["content"]
#   
#   token_dict = {
#     'prompt_tokens':response['usage']['prompt_tokens'],
#     'completion_tokens':response['usage']['completion_tokens'],
#     'total_tokens':response['usage']['total_tokens'],
#   }
#   
#   return content, token_dict
#######################
  
get_completion_and_token_count <- function(messages, model = "gpt-3.5-turbo", temp = 0, max_tokens = 500) {
  
  response <- openai::create_chat_completion(model = model, 
                                             messages = messages, 
                                             temperature = temp,
                                             max_tokens = max_tokens)
  
  content <- response$choices$message.content
  
  token_dict <- list(
    prompt_tokens = response$usage$prompt_tokens,
    completion_tokens = response$usage$completion_tokens,
    total_tokens = response$usage$total_tokens
  )
  
  return(list(content = content, tokens = token_dict))
}

# EXAMPLE:
# messages =  list(
#   list("role" = "system",
#        "content" = "You are an assistant who responds in the style of Dr. Seuss"),
#   list("role" = "user",
#        "content" = "Write me a very short poem about a happy carrot.")
#   )
# 
# out <- get_completion_and_token_count(messages)
# out$content 
# out$tokens

