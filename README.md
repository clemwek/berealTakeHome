# BeRealTakeHome

An iOS application showcasing a simplified “stories” feature (inspired by Instagram) built with SwiftUI. This take-home assignment demonstrates networking, state management, file-based persistence, and a clean, modular architecture.


https://github.com/user-attachments/assets/238d74ef-93e5-40bd-9df7-ab3a224b9e46



## Table of Contents

1. [Features](#features)
2. [Tech Stack](#tech-stack)
3. [Getting Started](#getting-started)

   * [Prerequisites](#prerequisites)
   * [Installation](#installation)
   * [Running the App](#running-the-app)
4. [Configuration](#configuration)
5. [Mock Data](#mock-data)
6. [Architecture & Project Structure](#architecture--project-structure)
7. [Utilities](#utilities)
8. [Testing](#testing)
9. [Contributing](#contributing)
10. [License](#license)

---

## Features

* **Login Flow** (stubbed)
* **Stories Feed**

  * Horizontal scrolling list of user stories
  * “Add Your Story” bubble
  * Tap to view full-screen story detail
  * Double-tap or heart icon to like/unlike stories
  * Seen indicator around story thumbnails
* **Networking Layer**

  * Generic `APIRequest` client supporting GET/POST/PUT/DELETE
  * Inline & file-based mock JSON support
  * Reachability check via `NetworkMonitor` (optional)
* **Persistence**

  * `StoriesFileManager` for reading/writing local JSON files
* **Localization**

  * Strings stored in `SupportingFiles/Localization`
* **Modular Architecture**

  * Feature-based grouping: Root, Login, Home, Stories, Common
  * Utilities for shared functionality

---

## Tech Stack

* **Language:** Swift 5.8+
* **UI:** SwiftUI 5
* **Minimum iOS:** 16.0
* **Xcode:** 15.0+
* **Dependency Management:**
* - SwiftKeychainWrapper
* - SwiftLintPlugin

---

## Getting Started

### Prerequisites

* Xcode 15.0 or later
* macOS 14.0 or later

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/clemwek/berealTakeHome.git
   ```
2. Open the project:

   ```bash
   open berealTakeHome/berealTakeHome.xcodeproj
   ```

### Running the App

1. Select the `berealTakeHome` scheme.
2. Choose a simulator (e.g., iPhone 15 Pro).
3. Build & Run (`⌘R`).

---

## Configuration

All environment and API settings live in `Config/Config.swift`:
- Note this is not used for this moment.

```swift
struct Config {
  static let shared = Config()
  let scheme = "https"
  let host   = "0659cfad-0dd9-4da1-8af6-7f5e1857ba25.mock.pstmn.io"
}
```

To point at a real backend, update `scheme` and `host` accordingly and remove or disable the `mockData` parameter in `StoriesAction`.

---

## Mock Data

* **Inline mocks:** Provided in `StoriesAction.loadMockJson()`.
* **Bundle mocks:** Place a `mockStories.json` file in `Resources/Mock/` and load it via:

  ```swift
  let url = Bundle.main.url(forResource: "mockStories", withExtension: "json")
  let data = try Data(contentsOf: url)
  ```

---

## Architecture & Project Structure

```
Project
├── Config/
│   └── Config.swift
├── Resources/
│   ├── Images/             # asset catalog
│   └── Mock/               # JSON fixtures
├── Code/
│   ├── Utilities/          # shared helpers & clients
│   │   ├── APIRequest.swift
│   │   ├── Auth.swift
│   │   ├── NetworkMonitor.swift
│   │   └── StoriesFileManager.swift
│   └── Features/
│       ├── Root/           # app entry & navigation
│       ├── Login/          # login screens & view models
│       ├── Home/           # home feed & view models
│       ├── Stories/        # stories feature
│       │   ├── Actions/    # StoriesAction.swift
│       │   ├── Models/     # StoryModel.swift, Story.swift, StoriesRequest.swift, StoriesResponse.swift
│       │   ├── ViewModels/# StoriesViewModel.swift
│       │   └── Views/      # StoryStrip, UserStory, AddUserStories, StoryDetailScreen
│       └── Common/         # shared view components & models
├── SupportingFiles/
│   └── Localization/       # Localizable.strings files
└── berealTakeHomeApp.swift # App entry point
```

---

## Utilities

* **APIRequest:** Generic network client
* **Auth:** Token storage & retrieval
* **NetworkMonitor:** Reachability watcher
* **StoriesFileManager:** File-copy & read/write for local JSON
* **Extensions:** Handy `Bundle` decode helpers, `URLComponents` builders, etc.

---

## Testing

No test target is included. To add tests:

1. Create a new Unit Test target in Xcode.
2. Add `mockStories.json` to the test bundle.
3. Write tests for:

   * `StoriesViewModel.fetchStories()` publishing correct output
   * `APIRequest` decoding mock data
   * `StoriesFileManager` read/write operations

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your changes.

---

## License

Provided **as-is** for demonstration purposes.
