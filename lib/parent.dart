const int _posixPathSeparator = 47;
const int _windowsPathSeparator = 92;
const int _dot = 46;

bool isWindows = false;

bool _isPathSeparator(int ch) => isWindows
    ? ch == _posixPathSeparator || ch == _windowsPathSeparator
    : ch == _posixPathSeparator;
String get _pathSeparatorString => isWindows ? r'\' : '/';

class FileSystemEntity {
  static String parentOf(String path) {
    if (path.length == 0) {
      return '.';
    }

    int chop = 0;
    int state = 0;
    for (int ch in path.codeUnits.reversed) {
      chop += 1;
      if (state == 0) {
        // Initial state.
        if (ch == _dot) {
          state = 2;
        } else if (_isPathSeparator(ch)) {
          // pass
        } else {
          state = 1;
        }
      } else if (state == 1) {
        // Past trailing special characters state.
        if (_isPathSeparator(ch)) {
          state = 4;
        }
      } else if (state == 2) {
        // Saw a dot state.
        if (ch == _dot) {
          state = 3;
        } else if (_isPathSeparator(ch)) {
          return path.substring(0, path.length - chop);
        } else {
          state = 1;
        }
      } else if (state == 3) {
        // Saw two dots state.
        if (_isPathSeparator(ch)) {
          return path.substring(0, path.length - chop);
        } else {
          state = 1;
        }
      } else if (state == 4) {
        // Chopping separators state.
        if (!_isPathSeparator(ch)) {
          return path.substring(0, path.length - chop + 1);
        }
      }
    }
    if (state == 0 || state == 4) {
      return _pathSeparatorString;
    } else if (state == 2) {
      return '..';
    } else if (state == 3) {
      return '..$_pathSeparatorString..';
    } else {
      return '.';
    }
  }
}
