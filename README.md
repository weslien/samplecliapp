# Sample dart CLI app
A simple command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`. The app is a very basic card game.

# Setup

1. Install dart from <https://dart.dev/get-dart>
2. Navigate to the project's folder
3. Install dependencies running this command:

```bash
dart pub get
```

## Running

After the setup you can start the app simply by running

```bash
dart ./bin/main.dart
```

from the project's folder

# Tests

App has just a couple of simple unit tests for a game model
To start tests simply run

```bash
dart test
```

# Notes

_Game model is the only one with tests, but it's still not fully tested, a logic to handle cases like calling `play()` multiple times or dealing cards are not handled gracefully etc. But I believe it's not the point of this exercise to make full-blown tests and to make this simple app perfect or to waste time trying to ;)_