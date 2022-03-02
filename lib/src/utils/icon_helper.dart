enum IconName {
  person,
  marker,
  whatsapp,
  github,
  linkedin,
  projects,
  trajectory,
  contact,
  certificate,
}

class IconHelper {
  static final urls = [
    'lib/assets/icons/user.png',
    'lib/assets/icons/pin.png',
    'lib/assets/icons/whatsapp.png',
    'lib/assets/icons/github.png',
    'lib/assets/icons/linkedin.png',
    'lib/assets/icons/project-management.png',
    'lib/assets/icons/itinerary.png',
    'lib/assets/icons/contact.png',
    'lib/assets/icons/certificate.png',
  ];

  static String getPath(IconName iconName) => urls[iconName.index];
}
