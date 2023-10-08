# Flutter Boilerplate Project

A boilerplate project created in flutter using Bloc, Retrofit. Depend on code generation.

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The
repository code is preloaded with some basic components like basic app architecture, app theme,
constants and required dependencies to create a new project. By using boiler plate code as standard
initializer, we can have same patterns in all the projects that will inherit it. This will also help
in reducing setup & development time by allowing you to use same code pattern and avoid re-writing
from scratch.

## How to Use

**Step 1:**

Fork, download or clone this repo.

**Step 2:**
Go to project root and execute the following command in terminal to get the required dependencies
and generate languages, freezed, flutter gen:

```cmd
flutter pub get
dart run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs
```

**Step 3:**
Go to `/packages/rest_client` and execute the following command in terminal to generate model and
api client:

```cmd
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

**Whenever change freezed file, assets, api**

Run command

```cmd
flutter pub get && dart run build_runner build --delete-conflicting-outputs
```

## Folder structure

```
flutter_boilerplate/
|- assets/                    (assets)
|- lib/
  |- configs/                 (flavor config)
  |- constants/               (app constants)
  |- core/                    (bloc observer, theme,...)
  |- data/                    (repository)
  |- usecases/                (features page)
  |- generated/               (code generation includes localization and assets generation)
  |- l10n/                    (localization resources
  |- router/                  (routing)
  |- services/                (app services)
  |- utils/                   (app utils)

```