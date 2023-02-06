import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:dart_vlc_ffi/src/internal/ffi.dart';

/// Represents a playback [Track] for the [Player].
class Track {
  /// ID corresponding to the [Track].
  final String id;

  /// Name of the [Track].
  final String name;

  const Track(this.id, this.name);
}

/// [Tracks.all] getter is used to get [List] of all available [Track] for playback in the [Player].
class Tracks {
  /// Gets [List] of all available playback [Track].
  static List<Track> all(int playerID, String trackType) {
    List<Track> tracksObject = <Track>[];
    final _tracksPointer = PlayerFFI.getAllTracks(playerID, trackType.toNativeUtf8(), tracksObject);
    for (int i = 0; i < _tracksPointer.ref.size; i++) {
      final _track = _tracksPointer.ref.tracks.elementAt(i);
      tracksObject.add(Track(
          _track.ref.id.toDartString(), _track.ref.name.toDartString()));
    }
    return tracksObject;
  }

  static int getCurrentTrack(int playerID, String trackType) {
    return PlayerFFI.getCurrentTrack(playerID, trackType.toNativeUtf8());
  }
}


