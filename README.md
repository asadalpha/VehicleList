# bike_app

Welcome to **bike_app**, a Flutter project that showcases the use of Provider for state management, Shared Preferences for persistent data storage, and other key features.

## Overview

This Flutter project serves as a foundation for a mobile application focused on managing vehicle information. Below, you'll find a brief overview of the key components and technologies used.

## Features

### State Management with Provider

- The project employs the Provider package for efficient state management.
- `AppProvider` class, extending `ChangeNotifier`, manages the list of vehicles.
- Vehicle-related UI components dynamically update based on changes in the provider.

### Persistent Data Storage with Shared Preferences

- Shared Preferences is utilized to store and retrieve simple data persistently.
- Commonly used for storing user preferences or data that needs to persist across app sessions.
- Example:
  ```dart
  // Save data to Shared Preferences
  void saveUserData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Retrieve data from Shared Preferences
  Future<String?> getUserData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
