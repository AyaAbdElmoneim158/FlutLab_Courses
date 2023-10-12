import 'package:audioplayers/audioplayers.dart';

class AudioplayersHelper {
  static late AudioPlayer player;

  static AudioPlayer init() => player = AudioPlayer();

  static void play({required String path}) async {
    await player.stop();
    await player.play(AssetSource(path));
  }

  static void stop({required String path}) async {
    await player.stop();
  }
}
