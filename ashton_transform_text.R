# Ashton Drew
# OpenAI Course Notes 
# November 2023

library(openai)

source("function_get_completions.R")

prompt = "Translate the following English text to Spanish: \ 
```Hi, I would like to order a blender```"

response = get_completions(prompt)
print(response)

prompt = "Translate the following text to Spanish in both the \
formal and informal forms: 
'Would you like to order a pillow?'"

response = get_completions(prompt)
print(response)




