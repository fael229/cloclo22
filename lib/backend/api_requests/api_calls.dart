import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StatutCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statut',
      apiUrl: 'https://api.fedapay.com/v1/transactions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic stat(dynamic response) => getJsonField(
        response,
        r'''$..status''',
      );
}

class StatutCopyCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statut Copy',
      apiUrl: 'https://api.fedapay.com/v1/transactions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic stat(dynamic response) => getJsonField(
        response,
        r'''$..status''',
      );
}

class StatutCopyCopyCopyCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statut Copy Copy Copy',
      apiUrl: 'https://api.fedapay.com/v1/transactions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic stat(dynamic response) => getJsonField(
        response,
        r'''$..status''',
      );
}

class StatutCopyCopyCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statut Copy Copy',
      apiUrl: 'https://api.fedapay.com/v1/transactions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic stat(dynamic response) => getJsonField(
        response,
        r'''$..status''',
      );
}

class TransactionsTokenCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'transactions token',
      apiUrl: 'https://api.fedapay.com/v1/transactions/${id}/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransactionGenererCall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? amount = '',
    String? currency = '',
    String? callbackUrl = '',
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? number = '',
    String? country = '',
  }) {
    final body = '''
{
  "description": "${description}",
  "amount": ${amount},
  "currency": {
    "iso": "${currency}"
  },
  "callback_url": "${callbackUrl}",
  "customer": {
    "firstname": "${firstname}",
    "lastname": "${lastname}",
    "email": "${email}",
    "phone_number": {
      "number": "${number}",
      "country": "${country}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'transaction generer',
      apiUrl: 'https://api.fedapay.com/v1/transactions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransactionGenererTrCall {
  static Future<ApiCallResponse> call({
    String? mode = '',
    String? amount = '',
    String? currency = '',
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? number = '',
    String? country = '',
  }) {
    final body = '''
{
  "amount": ${amount},
  "currency": {
    "iso": "${currency}",
  },
  "mode": "${mode}"
  "customer": {
    "firstname": "${firstname}",
    "lastname": "${lastname}",
    "email": "${email}",
    "phone_number": {
      "number": "${number}",
      "country": "${country}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'transaction generer tr',
      apiUrl: 'https://api.fedapay.com/v1/payouts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaiementSansRediCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? moyensPaie = '',
  }) {
    final body = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'paiement sans redi',
      apiUrl: 'https://api.fedapay.com/v1/${moyensPaie}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_live_-1dFz75QX2my3HVaWzqXyzWv',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$..status''',
      );
  static dynamic idd(dynamic response) => getJsonField(
        response,
        r'''$..intentable_id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
