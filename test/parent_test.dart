import 'package:parent/parent.dart';
import 'package:test/test.dart';
import 'package:test/test.dart' as testLib;

class Expect {
  static void equals(String x, String y) {
    expect(y, testLib.equals(x));
  }
}

void main() {
  test('posix', () {
    Expect.equals('/dir', FileSystemEntity.parentOf('/dir/file'));
    Expect.equals('/dir', FileSystemEntity.parentOf('/dir/file/'));
    Expect.equals('/dir', FileSystemEntity.parentOf('/dir//file//'));
    Expect.equals('/', FileSystemEntity.parentOf('/dir'));
    Expect.equals('/', FileSystemEntity.parentOf('/dir///'));
    Expect.equals('/', FileSystemEntity.parentOf('/'));

    Expect.equals('.', FileSystemEntity.parentOf('file'));
    Expect.equals('.', FileSystemEntity.parentOf('file//'));
    Expect.equals('.', FileSystemEntity.parentOf(''));
    Expect.equals('../..', FileSystemEntity.parentOf('..'));  // changed
    Expect.equals('..', FileSystemEntity.parentOf('.'));  // change
    // Expect.equals('.', FileSystemEntity.parentOf('')); delete duplicate of above
    Expect.equals('/', FileSystemEntity.parentOf('/'));
    Expect.equals('/', FileSystemEntity.parentOf('//'));
    Expect.equals('/', FileSystemEntity.parentOf('//file///'));
    Expect.equals('dir', FileSystemEntity.parentOf('dir/file'));
    Expect.equals('dir', FileSystemEntity.parentOf('dir/file/'));
    Expect.equals('dir', FileSystemEntity.parentOf('dir/file//'));
    Expect.equals('dir/subdir', FileSystemEntity.parentOf('dir/subdir/file'));
    Expect.equals(
        'dir//subdir', FileSystemEntity.parentOf('dir//subdir//file/'));
    Expect.equals(
        'dir/sub.dir', FileSystemEntity.parentOf('dir/sub.dir/fi le///'));
    Expect.equals('dir/..', FileSystemEntity.parentOf('dir/../file/'));
    // Expect.equals('dir/..', FileSystemEntity.parentOf('dir/../..'));
    // Expect.equals('.', FileSystemEntity.parentOf('./..'));
    // Expect.equals('..', FileSystemEntity.parentOf('../.'));
  });

  test('windows', () {
    // Expect.equals(r'C:/dir', FileSystemEntity.parentOf(r'C:/dir/file'));
    // Expect.equals(r'C:/dir', FileSystemEntity.parentOf(r'C:/dir/file/'));
    // Expect.equals(r'C:\dir', FileSystemEntity.parentOf(r'C:\dir\file'));
    // Expect.equals(r'C:\dir', FileSystemEntity.parentOf(r'C:\dir\file\'));
    // Expect.equals(r'C:\dir', FileSystemEntity.parentOf(r'C:\dir\\file\\'));
    // Expect.equals(r'C:\', FileSystemEntity.parentOf(r'C:\dir'));
    // Expect.equals(r'C:\', FileSystemEntity.parentOf(r'C:\dir\/\'));
    // Expect.equals(r'C:\', FileSystemEntity.parentOf(r'C:\'));
    // // FileSystemEntity.isAbsolute returns false for 'C:'.
    // Expect.equals(r'.', FileSystemEntity.parentOf(r'C:'));

    // Expect.equals(r'\\server\share\dir',
    //     FileSystemEntity.parentOf(r'\\server\share\dir\file'));
    // Expect.equals(r'\\server\share\dir',
    //     FileSystemEntity.parentOf(r'\\server\share\dir\file\'));
    // Expect.equals(
    //     r'\\server\share', FileSystemEntity.parentOf(r'\\server\share\file'));
    // Expect.equals(r'\\server\', FileSystemEntity.parentOf(r'\\server\share'));
    // Expect.equals(r'\\server\', FileSystemEntity.parentOf(r'\\server\share\'));
    // Expect.equals(r'\\server\', FileSystemEntity.parentOf(r'\\server\'));
    // Expect.equals(r'\\server/', FileSystemEntity.parentOf(r'\\server/'));
    // Expect.equals(r'\\serve', FileSystemEntity.parentOf(r'\\serve'));

    // Expect.equals(r'.', FileSystemEntity.parentOf(r'file'));
    // Expect.equals(r'.', FileSystemEntity.parentOf(r''));
    // Expect.equals(r'.', FileSystemEntity.parentOf(r'..'));
    // Expect.equals(r'.', FileSystemEntity.parentOf(r'.'));
    // Expect.equals(r'.', FileSystemEntity.parentOf(r''));
    // Expect.equals(r'/', FileSystemEntity.parentOf(r'/'));
    // Expect.equals(r'\', FileSystemEntity.parentOf(r'\'));
    // Expect.equals(r'\', FileSystemEntity.parentOf(r'\file\\/'));
    // Expect.equals(r'dir', FileSystemEntity.parentOf(r'dir\file'));
    // Expect.equals(r'dir', FileSystemEntity.parentOf(r'dir\file\'));
    // Expect.equals(r'dir', FileSystemEntity.parentOf(r'dir/file/'));
    // Expect.equals(r'dir\subdir', FileSystemEntity.parentOf(r'dir\subdir\file'));
    // Expect.equals(
    //     r'dir\sub.dir', FileSystemEntity.parentOf(r'dir\sub.dir\fi le'));
  });
}
