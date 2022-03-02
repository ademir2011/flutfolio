enum ImageName {
  defaulti,
}

class ImageHelper {
  static final urls = [];

  static String getPath(ImageName imageName) => urls[imageName.index];
}
