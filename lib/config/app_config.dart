class AppConfig {
  final String dogApiBaseUrl;

  AppConfig({required this.dogApiBaseUrl});
}

class DefaultConfig extends AppConfig {
  DefaultConfig() : super(dogApiBaseUrl: "https://api.thedogapi.com/v1");
}

class IntegrationTestConfig extends AppConfig {
  IntegrationTestConfig() : super(dogApiBaseUrl: "http://localhost:3019");
}
