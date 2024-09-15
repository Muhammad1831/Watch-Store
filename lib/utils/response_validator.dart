class ResponseValidator {
  static bool validateStatusCode({required statusCode}) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw ResponseException(statusCode);
    }
  }
}

class ResponseException implements Exception {
  int statusCode = 0;
  String message = 'Nothing';

  ResponseException(this.statusCode);

  @override
  String toString() {
    switch (statusCode) {
      case 400:
        message = 'Bad Request';
        break;
      case 401:
        message = 'UnautRequesthorized';
        break;
      case 403:
        message = 'Forbidden';
        break;
      case 404:
        message = 'Not Found';
        break;
      case 500:
        message = 'Internal Server Error';
        break;
      case 501:
        message = 'Not Implemented';
        break;
      case 502:
        message = 'Bad Gateway';
        break;
      case 503:
        message = 'Service Unavailable';
        break;
      case 504:
        message = 'Gateway Timeout';
        break;
      default:
        message = 'Uknown Error';
    }

    return 'ResponseException : statusCode $statusCode, message $message';
  }
}
