#ifndef TRACKS_TRACK_H_
#define TRACKS_TRACK_H_

#include <map>
#include <vector>
#include <vlcpp/vlc.hpp>

class Track {
 public:
  const std::string& id() const { return id_; }
  const std::string& name() const { return name_; }

  Track(std::string id, std::string name) : id_(id), name_(name) {}

 private:
  std::string id_;
  std::string name_;
};

#endif