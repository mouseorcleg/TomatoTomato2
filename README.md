# TomatoTomato
TomatoTomato is a productivity app that combines the features of a to-do list and a Pomodoro timer*, helping users easily track their tasks and monitor the time spent on them.

*if it’s the first time you hear about it, check out [the Pomodoro® Technique](https://francescocirillo.com/products/the-pomodoro-technique) explained by it's author.

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
- TomatoTomato was built using the MVVM (Model-View-ViewModel) architecture.
- The app’s user interface was developed using SwiftUI with support for Dark mode, Landscape and iPad. Storyboard was used only for the Launch screen. 
- CoreData is used as the database solution, allowing for efficient data storage and retrieval with a fully integrated with the SwiftUI framework.
- In future updates, CloudKit will be integrated for data synchronisation across multiple devices.

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

## 📝 Credits and acknowledgements
I want to extend my heartfelt gratitude to [Nick Sarno](https://github.com/SwiftfulThinking) and his YouTube channel, [Swiftful Thinking](https://youtube.com/c/SwiftfulThinking), for providing the foundation and inspiration for this project through [his ToDo app course](https://youtube.com/playlist?list=PLwvDm4VfkdpheGqemblOIA7v3oq0MS30i). 

I would also like to thank [Paul Hudson](https://github.com/twostraws) and the team at [Hacking with Swift](https://www.hackingwithswift.com) for providing invaluable resources where I found answers to many of my questions. 

I am extremely grateful to my mentor, [@togramago](https://github.com/togramago), for her unwavering patience and support throughout this journey. 

I am also grateful to the creators of ChatGPT for releasing this powerful tool, which has been instrumental in debugging and improving the app. 

Lastly, I would like to thank [Sean Allen](https://github.com/SAllen0400) and his [YouTube channel](https://www.youtube.com/c/SeanAllen) for inspiring me to make this ReadMe visually engaging and hopefully not too boring to read.

## ©️ License
MIT license [@mouseorcleg](https://github.com/mouseorcleg)
- - - -
👋 Say hello on [Twitter](https://twitter.com/mouse_or_cleg) or [LinkedIn](https://www.linkedin.com/in/maria-kharybina-b0993148/).
