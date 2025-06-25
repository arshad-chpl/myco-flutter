enum Flavor { dev, staging, prod }

class Environment {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev.api.myco.com';
      case Flavor.staging:
        return 'https://staging.api.myco.com';
      case Flavor.prod:
        return 'https://api.myco.com';
    }
  }
}
