enum VideoName {
  defaulti,
}

class VideoHelper {
  static final urls = [];

  static String getPath(VideoName videoName) => urls[videoName.index];
}
