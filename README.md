# Project

Flutter Riverpod Project

---

## Project structure

*Riverpod* allows very clean implementations with provider ***watch*** rebuilds replacing StatefullWidgets in many cases.  
It also provides lazy dependency management (with lifecycle control) with integrated updates notification.  

The project is organized with two layers: **domain** and **presentation** using *riverpod* state management.  

The ***domain*** layer defines:
  - Immutable entities (with *Freezed* package).
  - Business exceptions.
  - Use cases with *riverpod* StateNotifiers that:
    - Are public to be observed by the ***presentation*** layer (state management).
    - And private for updates. All updates must be handled through use cases, ensuring business rules.

The ***presentation*** layer:
  - Uses *riverpord* to watch ***domain*** StateNotifiers and Providers.
  - Renders the interface.
  - Responds to user interaction by invoking use case APIs that will modify notifiers that trigger presentation rebuilds.



## Getting Started

Download src to a local folder, and from inside this folder:

Configure the project for Android or IOS:
```sh
$ flutter create --platforms android --org com.example .

or 

$ flutter create --platforms ios --org com.example .
```

Build with build_runner (for code generation):
```sh
$ flutter pub get
$ flutter pub run build_runner build --delete-conflicting-outputs
```

Run in your configured emulator or device:
```sh
$ flutter run
```
