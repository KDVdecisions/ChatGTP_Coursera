# Building Systems with thw ChatGPT API
# DeepLeraning.AI course
# 
# Unit: Language Models and the Chat Format

source("Functions/get_completion.R")
source("Functions/get_completion_from_messages.R")
source("Functions/get_completion_and_token_count.R")

# EXAMPLE 01:
# Define a role to the AI
messages =  list(
  list("role" = "system",
       "content" = "You are an assistant who responds in the style of Dr. Seuss"),
  list("role" = "user",
       "content" = "Write me a very short poem about a happy carrot.")
  )

response = get_completion_from_messages(messages, temp = 1)
cat(response)

# Example 02:
# Limit length of response
messages =  list(
  list("role" = "system",
       "content" = "All your responses must be one sentence long."),
  list("role" = "user",
       "content" = "Write me a story about a morose octopus.")
)

response = get_completion_from_messages(messages, temp = 1)
cat(response)

# Example 03:
# Assign multiple criteria to AI response
messages =  list(
  list("role" = "system",
       "content" = "You are an assistant who responds in the style of Dr. Seuss.  All your responses must be one sentence long."),
  list("role" = "user",
       "content" = "Write me a story about an adventurous oyster.")
)

# extra
response = get_completion_from_messages(messages, temp = 1)
cat(response)

messages =  list(
  list("role" = "system",
       "content" = "You are an assistant who responds in the style of Shakespeare.  All your responses must include a rhetorical question. All your responses must be less than five sentences long."),
  list("role" = "user",
       "content" = "Write me a story about an adventurous oyster.")
)

response = get_completion_from_messages(messages, temp = 1)
cat(response)

# The lesson covers the concept of tokens as the basic unit in LLMs

#  - token frequency influences response
#  - tokens are typically 3-4 charcters long NOT whole words
#  - certain tasks are not understood without additional guidance

response = get_completion("What is the capital of France?")
cat(response) # We could either get the answer OR another similar quiz question (unless we ask it to answer the question)

response = get_completion("Take the letters in lollipop and reverse them")
cat(response) # it reverses the tokens NOT the letters - not the expected answer

response = get_completion("Take the letters in l-o-l-l-i-p-o-p and reverse them")
cat(response) # each letter is assigned a token and then these are reversed, as expected
