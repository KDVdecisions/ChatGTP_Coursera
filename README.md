# ChatGTP_Coursera

Notes from the Coursera courses by Andrew Ng and Isa Fulford, October 2023

The course provides all notes and exercises in Python.  This project provides the same functions and completed exercises in R.  You can watch the videos and follow along in R.  There are two course folders, each with numbers R scripts that roughly correspond to the lecture units.  The FREE (!) video lectures by Ng and Fulford provide a lot of additional content to explain each exercise.

## Setup and Test API Access

My notes use the R package `openai`.  I created a paid OpenAI account and saved my access token in my personal R user environment using tools from the `usethis` package.  You can open your user environment with this command: `usethis::edit_r_environ(scope = "user")`.  In the file that opens, add:

>OPENAI_API_KEY=

Place your key value immediately behind the = symbol.  You can test if your set-up is working by running the commands in the script: **test_api_access.R**.

For these course, I added $25 to my OpenAI account and then used barely half of this, even though I played at many side projects beyond the course assignments.

## Course #1: ChatGPT Prompt Engineering for Developers

In [ChatGPT Prompt Engineering for Developers](https://www.coursera.org/learn/chatgpt-prompt-engineering-for-developers-project/ungradedLti/wFdpY/chatgpt-prompt-engineering-for-developers), you will learn how to use a large language model (LLM) to quickly build new and powerful applications.  Using the OpenAI API, you’ll be able to quickly build capabilities that learn to innovate and create value in ways that were cost-prohibitive, highly technical, or simply impossible before now. This short course taught by Isa Fulford (OpenAI) and Andrew Ng (DeepLearning.AI) will describe how LLMs work, provide best practices for prompt engineering, and show how LLM APIs can be used in applications for a variety of tasks, including:

   -  Summarizing (e.g., summarizing user reviews for brevity)

   -  Inferring (e.g., sentiment classification, topic extraction)

   -  Transforming text (e.g., translation, spelling & grammar correction)

   -  Expanding (e.g., automatically writing emails)

In addition, you’ll learn two key principles for writing effective prompts, how to systematically engineer good prompts, and also learn to build a custom chatbot. All concepts are illustrated with numerous examples, which you can play with directly in our Jupyter notebook environment to get hands-on experience with prompt engineering.

## Course #2: 
