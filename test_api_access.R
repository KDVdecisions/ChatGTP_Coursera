# Test Ability to Access and Use OpenAI

library(openai)
# I placed the api key in my user environment via
# usethis::edit_r_environ(scope = "user")

openai::create_completion(
  model = "ada",
  prompt = "When the rain began, we"
)

openai::create_image(
  prompt = "Christmas holiday card with a heart, flying hawk, and Christmas tree mixing the styles of Yukon artists Nathalie Parenteau"
  )

openai::create_image(
  prompt = "A christmas card with wolves giving comfort to a woman under a starry sky in the style of Yukon artists Nathalie Parenteau but with more red."
)

