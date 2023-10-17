# Chat GPT notes + links

- [Chat GPT notes + links](#chat-gpt-notes--links)
  - [Prompt questions](#prompt-questions)
  - [Other boring stuff - docs, chat AI keys, etc.](#other-boring-stuff---docs-chat-ai-keys-etc)


## Prompt questions

Exmample prompts:

   - Building/searching for options:
     - > I need to build *(some task requirements).* Should I *(list options)*? Explain the tradeoffs of each position.`
     - > ... What format of JSON should I use?
     - > Generate a project structure (foldes) for Spring Boot application. The application will use 3rd services over REST, will need access to respositories and will implement spring-web with thymeleaf for generating HTML pages as well as rest-controller for Angualar or React frontend.

   - Testing:
     - > Generate a test plan for the requirements listed below. Your tests shoudl follow then Given-When-Then testing forrmat.
       > 
       > Requirements:
       > - Build a dashboard wthat displays real-time ... analytics data for high-traffic web app
       > - The data will be read in JSON format from serveral APIs
       > - The dashboard should display condensed data that is updated every minute
       > - THe UI should be easy to use and navigate
       > - The dashboard should bed built using modern web technologies and be scaleable
     - > Write unit tests for the main edge cases on the below code snippet. You should follow Gherkin testing best practices. Your tests should be written in javascript using the Jest framework.

 -  Explain code (good for opensource, not for confidential code)
    -  > Explain the code below. Make sure to include explanations to each line, each function and to overall code snippet.
       > *Code follows.. here...*
 - **Generate regexes.**
 - **Generate test data (SQL, JSONs etc.)**
 - **Convert file formats.**
 - **Generate documentation.**
 - **Interviews - Generate code in javascript to solve the following challange.**
 - **Mock interview**
   - > I'am a (SOMEONE) interviewing for a new job. YOu'll be my technical interviewer. Please impersonate a (role of the interpereter) from (brief company description) and ask me (number of questions) interview questions based on the following job description, responsibilites and skills. (+paste relevant excerpt from the job description you're interviewing for)
 - Find bugs in code (good only for open-source - confidentialy)
   - Please find the bug in the code below. This is what it should be doing.
   - 1. Fetch the response from Stripe API for payments received last month.
   - 2. Parse the response json into arrays with all transactions
   - 3. Traverse the array to group all transactions from the earlky entity, and sums their accounts. The array is stored in diferent array
 - Refactor the code.
   - Rewrite the following code using Python, specifically the latest verison of the Flask framework.
 - Code reviews:
   - I'm opening a Pull Request with the code below. Write a code review for the following code, focusing on best practices such as code maintainability, security vulnerabilities and performance. + code.
 - Comment code
   - Comment the code below. Make sure the your comments are clear and follow code commenting best practices. Your response should be dispalyed inside a code block.
 
 ## Other boring stuff - docs, chat AI keys, etc.
 
Docs:

Azure access:
 - https://learn.microsoft.com/en-us/azure/cognitive-services/openai/chatgpt-quickstart


 ChatAI:

 https://www.awesomescreenshot.com/blog/knowledge/chat-gpt-api#What-is-Chat-GPT-API%3F

 Getting the keys:

  - https://platform.openai.com/account/api-keys

 API reference:
  - https://platform.openai.com/docs/api-reference/authentication


Get the keys
 - `pip install openai`

 Main documentation:
  - **https://platform.openai.com/docs/tutorials**


