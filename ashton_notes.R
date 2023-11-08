# Ashton Drew
# OpenAI Course Notes 
# November 2023

library(openai)

source("function_get_completions.R")

lamp_review = "Needed a nice lamp for my bedroom, and this one had additional storage and not too high of a price point. Got it fast.  The string to our lamp broke during the transit and the company happily sent over a new one. Came within a few days as well. It was easy to put together.  I had a missing part, so I contacted their support and they very quickly got me the missing piece! Lumina seems to me to be a great company that cares about their customers and products!!"

prompt = sprintf("What is the sentiment of the following product review, 
which is delimited with triple backticks?  Review text: '''%s'''", lamp_review)

  response = get_completions(prompt)
  print(response)




