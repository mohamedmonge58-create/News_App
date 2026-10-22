# 📰 News App

A Flutter news application that allows users to browse the latest news by category, explore articles, and customize the app experience with Arabic and English language support and light/dark themes.

## 📱 Screenshots

### Splash Screen
![Splash Screen](screenshots/splash%20screen.png)

### Home Screen
| Home Screen 1 | Home Screen 2 |
|---|---|
| ![Home Screen 1](screenshots/home%20screen%201.png) | ![Home Screen 2](screenshots/home%20screen%202.png) |

### Categories
| Category 1 | Category 2 |
|---|---|
| ![Category 1](screenshots/category1.png) | ![Category 2](screenshots/category2.png) |

### Articles
| Article Details | Article Sources |
|---|---|
| ![Article Details](screenshots/artical%20details.png) | ![Article Sources](screenshots/artical%20source.png) |

## ✨ Features

- Browse news articles by category.
- Retrieve news dynamically using REST APIs.
- View article details and open the full article externally.
- Search for news articles.
- Switch between Arabic and English.
- Customize the appearance with light and dark themes.
- Save language preferences locally using SharedPreferences.
- Responsive Flutter user interface.

## 🛠️ Technologies

- **Flutter** — Cross-platform UI development.
- **Dart** — Application programming language.
- **REST API** — Fetching news data.
- **Provider** — State management.
- **SharedPreferences** — Local preference persistence.
- **Flutter Localizations** — Arabic and English translations.
- **url_launcher** — Opening article links externally.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/mohamedmonge58-create/News_App.git
   ```

2. Navigate to the project directory:

   ```bash
   cd News_App
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Generate localization files:

   ```bash
   flutter gen-l10n
   ```

5. Run the application:

   ```bash
   flutter run
   ```

## 🌐 Localization

The application supports:

- **English**
- **Arabic**, with right-to-left layout support.

Users can change the language through the application settings.

## 🎨 Themes

The application supports light and dark themes to provide a customizable reading experience.

## 📂 Project Structure

```text
lib/
├── core/
│   ├── l10n/          # Localization resources
│   ├── routes/        # App navigation
│   ├── theme/         # Colors, assets, and themes
│   └── providerrr/    # Settings and state management
├── models/            # Data models
├── services/          # Network and API services
└── ...
```

## 👨‍💻 Author

**Mohamed Monge**

- GitHub: [mohamedmonge58-create](https://github.com/mohamedmonge58-create)

---

Built with Flutter and Dart.
