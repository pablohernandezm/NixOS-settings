{pkgs, ...}:{
  home.packages = with pkgs; [ vlc ];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "video/mpeg" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ]; # .mkv files
      "video/webm" = [ "vlc.desktop" ];
      "video/avi" = [ "vlc.desktop" ];
      "video/quicktime" = [ "vlc.desktop" ]; # .mov files
      "video/x-flv" = [ "vlc.desktop" ];     # .flv files
      "video/x-msvideo" = [ "vlc.desktop" ]; # Another common AVI type
      "video/3gpp" = [ "vlc.desktop" ];      # For mobile video
      "video/ogg" = [ "vlc.desktop" ];
      "video/x-theora" = [ "vlc.desktop" ];
      "video/x-webm" = [ "vlc.desktop" ];
      "application/x-mpegURL" = [ "vlc.desktop" ]; # .m3u8 playlists
      "application/vnd.apple.mpegurl" = [ "vlc.desktop" ]; # Another common m3u8 type
    };
  };
}
