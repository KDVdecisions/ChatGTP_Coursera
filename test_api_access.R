# Test Ability to Access and Use OpenAI

library(openai)
# I placed the api key in my user environment via
# usethis::edit_r_environ(scope = "user")

openai::create_completion(
  model = "ada",
  prompt = "When the rain began, we"
)

openai::create_image(
  prompt = "Christmas holiday card with a bird and an otter in the styles of the Group of Seven artists."
  )

openai::create_image(
  prompt = "simple icon based on themes of cooperation, modeling, and transportation"
)

