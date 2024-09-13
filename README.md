
# Speedo Transfer App
This project represents our **Final Bank Misr Internship project**. It is an iOS project built using Swift and UIKit.

## Overview
This project proposes a mobile application for secure and convenient money‬ transfers, incorporating features similar to online banking and mobile money apps.‬ 

The app's features align with predefined user stories and integrate seamlessly with the backend. The complete list of user stories can be found in the PDF located in the ``develop`` branch.

Our final work is included in the ``develop branch``

## Features

This App consists of multiple features including:-
- **Onboarding:** Introduces the app's main features to new users.
- **User Authentication:** Login, register, and logout functionality.
- **Session Timeout:** Redirects users to the login screen after inactivity.
- **Home Screen:** Displays the user's balance and recent transactions.
- **Local Notifications:** Sent after a successful transaction, with an option to view all notifications.
- **Favorites Management:** Add, delete, and select favorite contacts for faster transfers.
- **Money Transfer:** Allows secure transfers with proper validation.
- **Transaction History:** View details of all sent and received transactions.
- **Profile Information:** View and edit user details.

## Prerequisites
Before getting started, ensure you have the following installed on your machine:
- macOS 10.15 or later
- Xcode 13.3 or later
- CocoaPods (Install instructions [here](https://guides.cocoapods.org/using/getting-started.html))

## Steps to Install

- **Clone the repository**:
   Open your terminal and run the following command to clone the repository:

        git clone https://github.com/BM-Internship-Project/iOS-Team.git

- **Checkout the ``develop branch``**: Ensure you're working in the develop branch where the latest code resides:
    
        git checkout develop
   
- **Install CocoaPods dependencies**: Run the following command to install the required pods for the project:
        
        pod install

- **Open the project in Xcode**: After the dependencies are installed, open the project using the ``.xcworkspace`` file:

        open Registration.xcworkspace

## Usage
‭In order to use the app functionalities you must register with new account or log in with existing account, you can use this test account:-
- Email: testaccount@gmail.com
- Password: Testaccount@00

## Architecture 
Speedo Transfer project is implemented using the **Model-View-Controller (MVC)** architecture pattern.
- ___Model:___ Contains the data and any business logic required to handle that data.
- ___View:___ is responsible for displaying the UI design to the user.
- ___Controller:___ handles any user input or interactions and update the Model and View as needed.

## Structure

    Registration/
    ├── Shared          # Files that are shared across multiple parts of the project.
    ├── Manager         # Files manages API, tokens and userDefaults implying Singleton Pattern.
    ├── Utils           # Constant file and common helper functions to reuse.
    ├── Extension       # Common functions added as an extension for existing UI Components.
    └── Resources       # Non-code files such as images, colors, fonts and other types of assets. 

- ___Manager:___ 
    - API manager 
        - Handles APIs in multiple ways using native URL sessions and external Alamofire pod
    - UserDefaults manager
        - Checks if user visits the app for the first time to show onboarding screens
        - Checks if user is logged in or out
    - Keychain manager
        - Securely save and retrieve the token used in the APIs
    - Token manager
        - Calls the keychain functions to get and set the token 
- ___Extensions:___ Common functionality added to ``UIViewController`` and ``UIView`` through extensions.

## Dependencies
[CocoaPods](https://cocoapods.org) is used as a dependency manager. List of dependencies used:
- [pod 'Alamofire', '~> 5.6.4'](https://github.com/Alamofire/Alamofire) -> Networking library that ensures seamless intergration with backend APIs. 
- [pod 'IQKeyboardManagerSwift'](https://github.com/hackiftekhar/IQKeyboardManager) -> Smooth navigation between multiple text fields in the screen.
- [pod 'RAMAnimatedTabBarController'](https://github.com/Ramotion/animated-tab-bar) -> Gives an animation while switching between multiple tab bars.

## Screenshots

### Authentication
<img width=200 src="https://github.com/user-attachments/assets/47caee2b-0ab3-4521-a55b-5eb9951b3505">
<img width= 200 src= https://github.com/user-attachments/assets/e85db8bf-7727-4315-a761-a70c874ab5f0>
<img width= 200 src= https://github.com/user-attachments/assets/ac8c3c72-19bf-419f-9f26-cead441267e3>

### Home Screen
<img width= 200 src= https://github.com/user-attachments/assets/7ac718f5-462a-4b44-bced-2c34975771d2>

### Transactions
<img width= 200 src= https://github.com/user-attachments/assets/25384044-f1d5-45c3-b2ca-b20d8225b8e8>
<img width= 200 src= https://github.com/user-attachments/assets/3993cf4b-ac8c-465e-aaf5-2a60ebac4239>
<img width=200 src="https://github.com/user-attachments/assets/aca1cf11-96b3-40ae-b118-acad3db582d4">

### Transfer
<img width= 200 src= https://github.com/user-attachments/assets/432f3e56-5c86-4ef9-ab75-ce7470b64ecf>
<img width=200 src="https://github.com/user-attachments/assets/8d0982f2-5dd5-419a-a0ae-b5b801495c03">
<img width= 200 src= https://github.com/user-attachments/assets/60424013-318d-4ddc-964a-f22f6612cb6b>
<img width=200 src="https://github.com/user-attachments/assets/17dc4d71-e067-49de-b16c-1da71621720b">
<img width=200 src="https://github.com/user-attachments/assets/a63271d1-a100-426f-ba16-0d3819470c05">
<img width=200 src="https://github.com/user-attachments/assets/527a2802-23d1-47bb-b48a-f3121683f410">

### More
<img width=200 src="https://github.com/user-attachments/assets/18f306f2-012a-4159-b402-1ae36c9448d8">

### Profile
<img width=200 src="https://github.com/user-attachments/assets/b1f4e813-b145-4d9b-bc63-ae485f626634">
<img width=200 src="https://github.com/user-attachments/assets/2795548e-9727-4421-afce-b88ab1b6f877">
<img width=200 src="https://github.com/user-attachments/assets/aff46e7b-e251-4c76-aba6-a8196d15a342">
<img width=200 src="https://github.com/user-attachments/assets/f772300b-674f-406c-a4c7-ab0bd205165c">
<img width=200 src="https://github.com/user-attachments/assets/9a4547e1-fc4a-4e04-ab8d-fa670e6a11c0">
<img width=200 src="https://github.com/user-attachments/assets/b69fd40d-6307-4eb5-9058-2510911c1cc1">


## Resources

- Check our Figma Design for the app in [here](https://www.figma.com/design/Fxvx7Eytj9eQ88R49jz7mF/Speedo-Transfer-(Application))
- Check our list of API calls [here](https://documenter.getpostman.com/view/31979113/2sAXjSyoUB)

## Contributors
- Merna Islam - [GitHub](https://github.com/mernaislam)
- Malak Mohamed - [GitHub](https://github.com/MalakMohameed)
