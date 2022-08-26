const int _pathSeparator = 47;
const int _dot = 46;
const String _pathSeparatorString = '/';

class FileSystemEntity {
  static String parentOf(String path) {
    int chop = 0;
    int state = 0;
    for (int ch in path.codeUnits.reversed) {
      chop += 1;
      if (state == 0) {
        if (ch == _dot) {
          state = 2;
        } else if (ch == _pathSeparator) {
          // pass
        } else {
          state = 1;
        }
      } else if (state == 1) {
        if (ch == _pathSeparator) {
          state = 4;
        }
      } else if (state == 2) {
        if (ch == _dot) {
          state = 3;
        } else if (ch == _pathSeparator) {
          return '${path.substring(0, path.length - chop)}$_pathSeparatorString..';
        } else {
          state = 1;
        }
      } else if (state == 3) {
        if (ch == _pathSeparator) {
          return '$path$_pathSeparatorString..';
        } else {
          state = 1;
        }
      } else if (state == 4) {
        if (ch != _pathSeparator) {
          return path.substring(0, path.length - chop + 1);
        }
      }
    }
    if (state == 0 || state == 4) {
      return _pathSeparatorString;
    } else if (state == 2) {
      return '.';
    } else if (state == 3) {
      return '$path$_pathSeparatorString..';
    } else {
      return '.';
    }
  }
}
