# Building Systems with thw ChatGPT API
# DeepLeraning.AI course
# 
# Unit: Classification

source("Functions/get_completion_from_messages.R")

# Classify customer queries ----
# to handle different cases

delimiter = "####"
system_message = sprintf("You will be provided with customer service queries. \
The customer service query will be delimited with \
%s characters.
Classify each query into a primary category \
and a secondary category. 
Provide your output in json format with the \
keys: primary and secondary.

Primary categories: Billing, Technical Support, \
Account Management, or General Inquiry.

Billing secondary categories:
Unsubscribe or upgrade
Add a payment method
Explanation for charge
Dispute a charge

Technical Support secondary categories:
General troubleshooting
Device compatibility
Software updates

Account Management secondary categories:
Password reset
Update personal information
Close account
Account security

General Inquiry secondary categories:
Product information
Pricing
Feedback
Speak to a human", delimiter)

user_message = "I want you to delete my profile and all of my user data"
messages =  list(list(role = "system",
                      content = system_message),
                 list(role = "user",
                      content = paste0(delimiter, user_message, delimiter))
)

response = get_completion_from_messages(messages)
cat(response)

user_message = "Tell me more about your flat screen tvs"
messages =  list(list(role = "system",
                      content = system_message),
                 list(role = "user",
                      content = paste0(delimiter, user_message, delimiter))
)

response = get_completion_from_messages(messages)
cat(response)


