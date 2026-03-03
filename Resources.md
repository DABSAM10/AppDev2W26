# Resources

## Git Safe Directory
* git config --global --add safe.directory '*'

## School PC Dart and Flutter SDK (Version)
* Flutter: 3.22.2

* Dart: 3.4.3

* environment:
  sdk: ">=3.4.0 <4.0.0"

* flutter_lints: ^4.0.0

## Android Studio Emulator Config Based on School PC
* Java: 22

* android\settings.gradle: 
  - AGP: 8.6.0 =>
  - Kotlin: 2.1.0 =>

* android\wrapper\gradle-wrapper.properties
  - Gradle version compatible with Java 22: 8.8 =>

* android\app\build.gradle
  - compileOptions & kotlinOptions: JVM Target -> 17/21