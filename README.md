# packages-iOS

This repository contains multiple Swift packages for iOS development. Each package is designed to be reusable and can be integrated independently into your iOS projects.

## Packages

- [LocationManager](#locationmanager)

### LocationManager

`LocationManager` is a Swift package that provides a convenient way to manage location updates and authorization status using `CLLocationManager`. It integrates seamlessly with SwiftUI, leveraging `@Observable` and `@Published` properties to allow easy binding and state management.

#### Features

- Request location permissions.
- Track the authorization status.
- Get updates on the device's current location.
- Designed for iOS 17 and later.

#### Installation

To add the `LocationManager` package to your Xcode project using Swift Package Manager:

1. Open your project in Xcode.
2. Go to `File > Add Packages...`.
3. Enter the repository URL: `https://github.com/yourusername/packages-iOS.git`
4. Select `LocationManager` from the list of packages.
5. Add it to your project.

#### Usage

1. **Import the package:**

   ```swift
   import LocationManager
