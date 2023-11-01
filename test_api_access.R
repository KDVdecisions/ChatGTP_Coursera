# Test Ability to Access and Use OpenAI

library(openai)
# I placed the api key in my user environment via
# usethis::edit_r_environ(scope = "user")

openai::create_completion(
  model = "ada",
  prompt = "When the rain began, we"
)

openai::create_image(
  prompt = "NCDOT ATLAS project conserving nature and saving money with probabilistic models in the style of picasso"
  )
