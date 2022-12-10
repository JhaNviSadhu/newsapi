const ENV env = ENV.dev;

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