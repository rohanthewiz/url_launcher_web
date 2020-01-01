# A Flutter Web Plugin
This was created based on this article: https://medium.com/flutter/how-to-write-a-flutter-web-plugin-5e26c689ea1

** This is totally an experiment. Do not link to it at this time. Bad things may happen to your code**

### Why?
I wanted to capture the session cookie used in an Authorization Code Grant OAuth flow.
After reading this article https://itnext.io/an-oauth-2-0-introduction-for-beginners-6e386b19f7a9
 I was educated and realized that all I need is an Implicit Grant flow for my flutter for web app.

 ### Thoughts
 - It should be easier to create a web-only plugin. We should not have to piggy-back off of a standard IOS and Android plugin.
 - The web apps will require a lot more interaction with web things. Someone :-) should create a killer plugin for these.
   