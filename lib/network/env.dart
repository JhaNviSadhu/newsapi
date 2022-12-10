const ENV env = ENV.dev;

// setValue(apikey, "c6817e0442a2480185720574e93c2cbf");
const String baseUrl = "https://newsapi.org/v2/";

enum ENV { dev, qa, prod }

extension ConfigExt on ENV {
  String get baseurl {
    switch (this) {
      case ENV.qa:
        return 'https://newsapi.org/v2/';
      case ENV.dev:
        return 'https://newsapi.org/v2/';
      case ENV.prod:
        return 'https://newsapi.org/v2/';
    }
  }
}

// https://newsapi.org/v2/everything?q=election&apiKey=c6817e0442a2480185720574e93c2cbfconst ENV env = ENV.prod;