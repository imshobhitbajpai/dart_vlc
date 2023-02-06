#include "tracks/tracks.h"

std::vector<Track> Tracks::All() {
  std::vector<Track> tracks{};
  VLC::Instance vlc_instance = VLC::Instance(0, nullptr);
  VLC::MediaPlayer vlc_media_player = VLC::MediaPlayer(vlc_instance);
  std::vector<VLC::TrackDescription> vlc_tracks =
      vlc_media_player.audioTrackDescription();
  for (VLC::TrackDescription vlc_track : vlc_tracks) {
    tracks.emplace_back(Track(std::to_string(vlc_track.id()), vlc_track.name()));
  }
  return tracks;
}
