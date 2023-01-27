# TomatoTomato

<img align="right" src="https://user-images.githubusercontent.com/45575272/214887495-2ca768f0-5827-41b8-b479-23511ea8fb47.png" width="50" alt="app icon" > TomatoTomato is a productivity app that combines the features of a to-do list and a [Pomodoro timer](https://francescocirillo.com/products/the-pomodoro-technique), helping users easily track their tasks and monitor the time spent on them.

![GitHub_header](https://user-images.githubusercontent.com/45575272/215065855-c0f1126e-82a3-45f2-9245-c7b4564e323e.png)

## 📑 Table of content
* [Technologies](#-technologies)
* [Roadmap](#-roadmap)
  - [Start of the journey](#%EF%B8%8F-start-of-the-journey)
  - [Current status](#-current-status)
  - [Plans for the future updates](#-plans-for-the-future-updates)
* [ScreenShots](#-screenshots)
* [Credits and acknowledgements](#-credits-and-acknowledgements)
* [License](#%EF%B8%8F-license)

## 🛠 Technologies
- TomatoTomato was built using the **MVVM** (Model-View-ViewModel) architecture.
- The app’s user interface was developed using **SwiftUI** with support for Dark mode, Landscape and iPad. Storyboard was used only for the Launch screen. 
- **CoreData** is used as the database solution, allowing for efficient data storage and retrieval with a fully integrated with the SwiftUI framework.
- In future updates, _CloudKit_ will be integrated for data synchronisation across multiple devices.

## 🗺 Roadmap
### ✈️ Start of the journey
Time is one of our most valuable resources, yet it’s often the one we struggle to manage the most.

I noticed that one of my biggest planning obstacles is that I have no idea how much time I spent on different types of tasks. Whether it’s working on a  pet project, writing an article, or just trying to stay on top of my daily tasks, I wanted a way to track my time and make better use of it. And that’s how TomatoTomato journey began.

I hope that TomatoTomato can be useful for students who want to stay on top of their assignments, freelancers who want to optimise their workflow and anyone who wants to understand how they spent their time.

### 📱 Current status
TomatoTomato is currently in its first version and ready for use. The app includes all the basic screens and features necessary for effective time management. 

The main screen features a to-do list that allows users to easily view and manage their tasks. The detail screen allows to start a Pomodoro timer for each task and track the amount of time spent on it. The addTask and editTask screens provide a simple and intuitive way for users to create and modify their tasks.

While the functionality is currently basic, the app is stable and fully functional. Look at the next sections to find out about the our plans for the next update.

### 👩‍💻 Plans for the future updates
TomatoTomato is just getting started, and there are many exciting features in the pipeline. Here are a few we’re currently working on:

* Adding a due date parameter to the task data model, allowing users to filter tasks by their due date.
* Creating separate screens for unfinished, finished, and all tasks to make it easier to stay organised.
* Implementing an archive feature for completed tasks, so users can easily refer back to them later.
* Adding customisable task types and Pomodoro timer lengths through the use of UserDefaults.
* Allowing users to save timer progress even if it hasn’t completed a full tomato.
* Revamping the error handling system to ensure a seamless user experience.

There are a few more features that are waiting their turn:
* A history view and analysis feature that will allow users to track their progress over time and make more accurate estimates for future tasks.
* Integration with CloudKit to enable cross-platform use of the app, allowing users to access their tasks and time tracking data on multiple devices.
* Implement unit testing for improved code quality and reliability.

📮 If you have ideas or recommendations about the features for this app - please don’t hesitate to reach out on Twitter [@mouse_or_cleg](https://twitter.com/mouse_or_cleg).
Any feedback is highly appreciated!

## 📷 ScreenShots
Take a sneak peek of the user interface and functionality of TomatoTomato with these screenshots. From the main task list, to the task detail and editing screens, these images showcase the core features such as tracking time spent on tasks and the ability to add and edit tasks. Enjoy!

<details>
    <summary>✨ amazing screenshots ✨</summary>
<img height="400" alt="empty_list" src="https://user-images.githubusercontent.com/45575272/214915651-6a205273-dfd9-404b-a807-6aa6bb1128be.png"> <img height="400" alt="newTaskScreen" src="https://user-images.githubusercontent.com/45575272/214915795-86176947-ae32-4843-893d-7361b2c9eba8.png"> <img height="400" alt="list" src="https://user-images.githubusercontent.com/45575272/214916641-24046ce2-4194-4e5d-b985-7d86c2905966.png"> <img height="400" alt="detailScreen_inProgress" src="https://user-images.githubusercontent.com/45575272/214915928-8edb119b-46c7-4aff-9e07-805a4f83ca18.png"> <img height="400" alt="breakTime" src="https://user-images.githubusercontent.com/45575272/214916190-cbc57012-ced0-4dc6-bb64-707780fe2791.png"> <img height="400" alt="editScreen_darkMode" src="https://user-images.githubusercontent.com/45575272/214916078-387d919b-7b13-4e98-b3e6-b82f5fc93998.png"> <img width="400" alt="edit_landscape" src="https://user-images.githubusercontent.com/45575272/214918622-64d16baa-3347-4610-91e1-3288b8860644.png">
 </details>

<details>
  <summary>👾 and gifs 👾</summary>
  <img alt="launch screen" src="https://user-images.githubusercontent.com/45575272/215057761-ff74fc59-dfad-4026-a7dd-c39bda0aae4d.gif"> <img src="https://user-images.githubusercontent.com/45575272/214916929-2d9455db-9438-4273-b5f2-7f47e3891c0e.gif"  alt="Detail_and_Edit_screen"> <img src="https://user-images.githubusercontent.com/45575272/214916992-7ac2543d-74ba-41d7-9b3c-8c5a615e3389.gif"  alt="DetailView_Complete_and_InProgress">
  
 </details>

## 📝 Credits and acknowledgements
I want to extend my heartfelt gratitude to [Nick Sarno](https://github.com/SwiftfulThinking) and his YouTube channel, [Swiftful Thinking](https://youtube.com/c/SwiftfulThinking), for providing the foundation and inspiration for this project through [his ToDo app course](https://youtube.com/playlist?list=PLwvDm4VfkdpheGqemblOIA7v3oq0MS30i). 

I would also like to thank [Paul Hudson](https://github.com/twostraws) and the team at [Hacking with Swift](https://www.hackingwithswift.com) for providing invaluable resources where I found answers to many of my questions. 

I am extremely grateful to my mentor, [@togramago](https://github.com/togramago), for her unwavering patience and support throughout this journey. 

I am also grateful to the creators of [ChatGPT](https://chat.openai.com/) for releasing this powerful tool, which has been instrumental in debugging and improving the app. 

Lastly, I would like to thank [Sean Allen](https://github.com/SAllen0400) and his [YouTube channel](https://www.youtube.com/c/SeanAllen) for inspiring me to make this ReadMe visually engaging and hopefully not too boring to read.

## ©️ License
MIT license [@mouseorcleg](https://github.com/mouseorcleg)
- - - -
👋 Say hello on [Twitter](https://twitter.com/mouse_or_cleg) or [LinkedIn](https://www.linkedin.com/in/maria-kharybina-b0993148/).
