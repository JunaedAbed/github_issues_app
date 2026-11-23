# GitHub Issues Viewer

A Flutter app that loads the issues of a GitHub repository from the GitHub REST API and lets you filter them by label.

## Features
- Fetches issues from `api.github.com/repos/{owner}/{repo}/issues`
- Search box that filters issues by label ID, with an empty-state message when nothing matches
- Human-readable created dates
- Central error handling with typed exceptions and an error controller

## Tech stack
- **Flutter / Dart**
- **GetX** for state, routing and dependency bindings
- `intl` for date formatting

## Architecture
```
lib/
├── core/
│   ├── errors/     # AppException types + ErrorController
│   └── utils/      # date formatting, initial bindings
├── data/
│   ├── api/        # ApiClient
│   ├── models/     # issue response model
│   └── services/   # IssueRepository behind an interface
├── presentation/   # home screen: view, controller, components
└── routes/
```
The UI uses a repository interface, not the HTTP client directly, so you can swap the data source or mock it in tests.

## Run it
```bash
flutter pub get
flutter run
```

## Author
**Md Junaed Abed**: [Portfolio](https://abed-page.vercel.app) · [GitHub](https://github.com/JunaedAbed)
