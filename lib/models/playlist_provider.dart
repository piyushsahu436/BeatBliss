import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Song 1",
      artistName: "Artist 1",
      albumImagePath: 'assets/images/1.jpg',
      audioPath: "audio/Jeena.mp3",
    ),
    Song(
      songName: "Song 2",
      artistName: "Artist 2",
      albumImagePath: 'assets/images/2.jpg',
      audioPath: "audio/Jeena.mp3",
    ),
    Song(
      songName: "Song 3",
      artistName: "Artist 3",
      albumImagePath: 'assets/images/1.jpg',
      audioPath: "audio/Jeena.mp3",
    ),
  ];

  int? _currentSongIndex;
  bool _isPlaying = false;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  final AudioPlayer _audioPlayer = AudioPlayer();

  PlaylistProvider() {
    listenToDuration();
  }

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

  void goToSong(int index) {
    _currentSongIndex = index;
    notifyListeners();
  }

  void play() async {
    if (_currentSongIndex == null) return;
    final String path = _playlist[_currentSongIndex!].audioPath;
    print("Playing audio from: $path");
    await _audioPlayer.stop();
    try {
      await _audioPlayer.play(AssetSource(path));
      _isPlaying = true;
    } catch (e) {
      print("Error playing audio: $e");
    }
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration duration) {
    _audioPlayer.seek(duration);
    notifyListeners();
  }

  void playNextSong() {
    if (_currentSongIndex! < _playlist.length - 1) {
      _currentSongIndex = _currentSongIndex! + 1;
    } else {
      _currentSongIndex = 0;
    }
    play();
    notifyListeners();
  }

  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      _currentSongIndex = _playlist.length - 1;
    }
    play();
    notifyListeners();
  }

  Future<void> listenToDuration() async {
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((duration) {
      _currentDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
}
