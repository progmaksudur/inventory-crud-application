# Inventory CRUD Application

Inventory CRUD Application is a Flutter-based mobile application that allows users to perform CRUD (Create, Read, Update, and Delete) operations on an inventory. The application has been developed using Flutter Version 3.3.10 and utilizes several packages such as Dio, Get, Get_it, and Hive.

## Features

- User authentication: Users can log in to the application using their username and token, which are stored in shared preferences.
- Landing screen: After successful authentication, the user is directed to the landing screen, which provides access to three main sections of the application: home, add product, and profile.
- Product listing: The home section displays a list of all products stored in the local Hive database. The user can perform delete operations on these products.
- Product details: The product details page displays detailed information about a particular product. The user can edit or delete the product from this page.
- Add product: The add product section allows the user to add a new product to the inventory.
- Profile: The profile section displays the user's information and allows the user to log out of the application.

## Packages

The application utilizes the following packages:

- Dio: A powerful HTTP client for Dart that allows the application to interact with APIs.
- Get: A state management package that makes it easy to manage application state and navigation.
- Get_it: A package for dependency injection that allows the application to manage dependencies efficiently.
- Hive: A lightweight and fast NoSQL database that allows the application to store product information locally.

## Architecture

The application has been developed with a focus on clean architecture, which allows for easy maintainability, scalability, and testing. The codebase is organized into separate layers that handle different aspects of the application's functionality, including domain, data, and presentation layers.

## Getting Started

To run the application, clone the repository and open it in Android Studio or Visual Studio Code. Run `flutter pub get` to install the required packages, and then run the application on an emulator or a physical device.

## Download

You can download the latest APK version of the application from the following link:

- [Inventory CRUD Application APK](https://drive.google.com/file/d/12H8Okf7y4_kLGsMWvVo59Y6blJyfWFRq/view?usp=share_link)

## Conclusion

Inventory CRUD Application is a well-structured, easy-to-use mobile application that allows users to perform CRUD operations on an inventory. With its focus on clean architecture and efficient use of packages, the application is highly maintainable and scalable.
