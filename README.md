# Project

Flutter project

---

## Getting Started

Download src to a local folder, and from inside this folder:

Configure the project for Android or IOS:
```sh
$ flutter create --platforms android .

or 

$ flutter create --platforms ios .
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
