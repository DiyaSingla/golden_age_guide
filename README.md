# ISoC'23 App Dev Track: Golden Age Guide

## Project Overview:

Golden Age Guide is a comprehensive application designed to cater to the needs of senior citizens, providing them with a range of features to support their physical and emotional well-being as they age. It offers a secure and user-friendly environment for senior citizens to stay healthy, informed, connected, and entertained.

## Purpose:

The aim is to develop a one-stop application for senior citizens to get all they require in one place, be it articles, songs, activities, connectivity, or medical assistance. The app aims to address the unique needs of senior citizens and enhance their quality of life by offering a set of features that include health tracking, access to educational resources, entertainment options, emergency assistance, user profiles, and more. [Demo Video](https://drive.google.com/file/d/1--mF_qGHP5iF2VdzJDLnhERs5v2sDwxM/view?usp=sharing)

## Features:

1. **Authentication, Login, and Logout:**
    - Implements a secure login system with options for email and password authentication.
    - Allows users to log in and out of the application securely.

2. **Engaging Dashboard**
    - Shows Thought of the Day and the users can like/dislike the thought.
    - A bunch of holistic activities such as watering plants and calling grandchildren are shown to engage the users.

3. **Health Tracking:**
    - Monitors vital signs and health-related information.
    - Provides tools to track medications, fitness, diet, and Check Up tasks.

4. **Education and Entertainment:**
    - Offers access to a library of articles, videos, and books on aging gracefully.
    - Provides informative content to help users make informed health and lifestyle decisions.
    - Allows users to access movies and songs.

5. **Emergency Assistance:**
    - Incorporates an SOS feature that enables users to request immediate emergency help.
    - Connects users to emergency services or designated contacts.

6. **My Profile:**
    - Enables users to set up and manage their profiles.
    - Provides a centralized location for users to update personal information, preferences, and emergency contacts.

7. **Chatbot:**
    - Includes a chatbot feature (named "Silver Sage") to answer questions, provide guidance, and engage in conversation with users.
    - Enhances the user experience by offering information and companionship.
    -Implemented using ChatGPT API.

8. **Connect with Doctors:**
    - Allows users to connect with medical professionals for remote consultations.
    - Provides access to a list of doctors with their specialties and contact information.

## How to Run the Project:

The project is designed for mobile devices and can run on Android and iOS platforms. To run the project:
1. Ensure you have Flutter installed on your development environment.
2. Clone the project repository.
3. Open the project in your preferred integrated development environment (IDE) for Flutter, such as Android Studio or Visual Studio Code.
4. Install the project dependencies using the `flutter pub get` command.
5. The api_key is provided in this [link](https://docs.google.com/document/d/1JxpDWTEcexQ9kfFaKHl8AWkLwayE3xu4ps4UEYI_-Ys/edit?usp=sharing). Add this in line 45 of the chatbot_screen.dart file to access the chatbot.
6. Run the project on an emulator or physical device using the `flutter run` command.
7. Test and interact with the application's various features, including authentication, health tracking, education, entertainment, emergency assistance, user profiles, chatbot, and connecting with doctors.
8. You can sign up as a new user or use (diya@gmail.com/user@gmail.com, 123456) as the sigin credentials.

## Issues Solved:

The following issues were solved during the development of the project, both those provided by the team and additional issues identified and resolved independently:

**Provided Issues:**

1. **Authentication, Login, and Logout:** Implemented a secure login system with email and password authentication using Firestore.

2. **Health Tracking:** Developed features for monitoring vital signs and health-related information, including medication tracking.

3. **Education and Resources:** Created a content library for articles, videos, and books on aging gracefully.

4. **Entertainment and Engagements:** Implemented features for exploring movies, songs, and activities.

5. **Emergency Assistance:** Integrated an SOS feature for immediate help and connections to emergency services.

6. **My Profile:** Enabled users to set up and manage their profiles using Firestore.

**Additional Issues:**

7. **Chatbot:** Developed and integrated a chatbot named "Silver Sage" to provide information and companionship.

8. **Connect with Doctors:** Added a feature to connect users with medical professionals for remote consultations.
