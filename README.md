# DissertationProject2023

This is a mobile application designed to teach users the basics of security penetration testing. The app provides interactive learning modules, real-world examples, and hands-on exercises to help users gain practical knowledge and skills in the field of penetration testing.

## Table of Contents

1. [Features](#features)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Features

- Interactive learning modules covering various topics in security penetration testing
- Hands-on exercises for users to practice and apply learned concepts
- Real-world examples to demonstrate the practical application of penetration testing techniques
- Intuitive user interface and navigation, built using SwiftUI
- Firebase backend for user authentication, data storage, and retrieval
- Local device storage for caching user progress and preferences
- Comprehensive user documentation and resources

## Requirements

- iOS 13.0 or later
- Xcode 12.0 or later
- Firebase account and access to Firebase services (Firestore, Authentication)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/PenTestApp.git
```

2. Open the DissertationProject2023 project in Xcode

```bash
cd PenTestApp
open PenTestApp.xcodeproj
```

3. Set up Firebase:

- Sign up or log in to your Firebase account.
- Create a new Firebase project and add the iOS app to it.
- Follow the Firebase setup instructions to download and add the `GoogleService-Info.plist` file to your Xcode project.
- Install Firebase SDKs and libraries using CocoaPods by creating a `Podfile` with the required dependencies and running `pod install`.

4. Build and run the project

- Select the appropriate iOS device or simulator in Xcode.
- Press `Cmd + R` to build and run the app on your chosen device.

## Usage
- Users can sign up or log in to the app using the provided authentication screens.
- After logging in, users can navigate through the available learning modules and interactive exercises.
- User progress and preferences are stored locally on the device, as well as synced to the Firebase backend.

## Contributing

1. Fork the repository and create your branch:

```bash
git checkout -b your-feature-branch
```

2. Commit your changes:

```bash
git commit -am 'Add some feature'
```

3. Push your branch:

```bash
git push origin your-feature-branch
```

4. Open a Pull Request on GitHub to submit your changes for review.

## Licence
DissertationProject2023 is released under the MIT License. See LICENSE for details.
