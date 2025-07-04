import 'package:flutter_dotenv/flutter_dotenv.dart';

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

// class EnvironmentConfig {
  // static final String _env = dotenv.env['env'] ?? 'dev';

  // static String get mainURL {
  //   switch (_env) {
  //     case 'prod':
  //       return 'https://master.my-company.app/mainApiEnc/';
  //     case 'staging':
  //       return 'https://staging.my-company.app/mainApiEnc/';
  //     case 'dev':
  //     default:
  //       return 'https://dev.my-company.app/mainApiEnc/';
  //   }
  // }
// }
