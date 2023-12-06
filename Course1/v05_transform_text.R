# Ashton Drew
# OpenAI Course Notes 
# November 2023

library(openai)

source("Functions/get_completion.R")

# Translation ----

prompt = "Translate the following English text to Spanish: \ 
```Hi, I would like to order a blender```"
response = get_completion(prompt)
cat(response)

prompt = "Tell me which language this is: ```Combien coûte le lampadaire?```"
response = get_completion(prompt)
cat(response)

prompt = "Translate the following  text to French and Spanish and English pirate: ```I want to order a basketball```"
response = get_completion(prompt)
cat(response)

prompt = "Translate the following text to Spanish in both the \
formal and informal forms: 
'Would you like to order a pillow?'"

response = get_completion(prompt)
cat(response)

# Universal translator ----

user_messages = c(
  "La performance du système est plus lente que d'habitude.",  # System performance is slower than normal    
  "Mi monitor tiene píxeles que no se iluminan.",              # My monitor has pixels that are not lighting
  "Il mio mouse non funziona",                                 # My mouse is not working
  "Mój klawisz Ctrl jest zepsuty",                             # My keyboard has a broken control key
  "我的屏幕在闪烁"                                               # My screen is flashing
) 

for (issue in user_messages) {
  prompt <- sprintf("Tell me what language this is: ```%s```", issue)
  lang <- get_completion(prompt)
  cat(sprintf("Original message (%s): %s", lang, issue))
  
  prompt <- sprintf("Translate the following text to English and Korean: ```%s```", issue)
  response <- get_completion(prompt)
  cat(response)
}

# Tone Translation ----

prompt = "Translate the following from slang to a business letter: 'Dude, This is Joe, check out this spec on this standing lamp.'"
response = get_completion(prompt)
cat(response)

# Format Conversion ----

data_json = '{ "resturant employees" :[ 
  {"name":"Shyam", "email":"shyamjaiswal@gmail.com"},
  {"name":"Bob", "email":"bob32@gmail.com"},
  {"name":"Jai", "email":"jai87@gmail.com"}
]}'

prompt = sprintf("Translate the following from JSON to an HTML \
table with column headers and title: %s)", data_json)
response = get_completion(prompt)
cat(response)

data_rlist <- list(`resturant employees` = list(
  name = "Shyam", email = "shyamjaiswal@gmail.com",
  name = "Bob", email = "bob32@gmail.com",
  name = "Jai", email = "jai87@gmail.com")
)

prompt = sprintf("Translate the following from an R list to an HTML \
table with column headers and title: %s)", data_rlist)
response = get_completion(prompt)
cat(response)

# Spellcheck and Proofread ----

text = c("The girl with the black and white puppies have a ball.",  # The girl has a ball.
         "Yolanda has her notebook.", # ok
         "Its going to be a long day. Does the car need it’s oil changed?",  # Homonyms
         "Their goes my freedom. There going to bring they’re suitcases.",  # Homonyms
         "Your going to need you’re notebook.",  # Homonyms
         "That medicine effects my ability to sleep. Have you heard of the butterfly affect?", # Homonyms
         "This phrase is to cherck chatGPT for speling abilitty")  # spelling

for (t in text) {
  prompt = sprintf("Proofread and correct the following text
    and rewrite the corrected version. If you don't find
    and errors, just say 'No errors found'. Don't use 
    any punctuation around the text: ```%s```", t)
  response = get_completion(prompt)
  cat(response)
}

# The AI did very poorly on the task, missing #4, 5, and 7
# Tried again and missed #3, 5, and 7
# tried again annd missed #5 and 7
# 3-6 are homonyms, 7 is a spelling error

# Tried to modify with more explicit instructions.
for (t in text) {
  prompt = sprintf("Proofread and correct the following text
    and rewrite the corrected version. Correct misused homonyms.  If you don't find
    and errors, just say 'No errors found'. Don't use 
    any punctuation around the text: ```%s```", t)
  response = get_completion(prompt)
  cat(response)
}

# All correct this time, including #7 spelling error

text = "Got this for my daughter for her birthday cuz she keeps taking \
mine from my room.  Yes, adults also like pandas too.  She takes \
it everywhere with her, and it's super soft and cute.  One of the \
ears is a bit lower than the other, and I don't think that was \
designed to be asymmetrical. It's a bit small for what I paid for it \
though. I think there might be other options that are bigger for \
the same price.  It arrived a day earlier than expected, so I got \
to play with it myself before I gave it to my daughter." 

prompt = sprintf("proofread and correct this review: ```%s```", text)
response = get_completion(prompt)
cat(response)

prompt = sprintf("proofread and correct this review. Make it more compelling. 
Ensure it follows APA style guide and targets an advanced reader. Output in markdown format.
Text: ```%s```", text)
response = get_completion(prompt)
cat(response)


