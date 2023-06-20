import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFFFC8171),
          child: Center(
            child: Image.asset(
              'assets/images/zem_food-1.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Onboarding1': ParameterData.none(),
  'user': ParameterData.none(),
  'Onboarding2': ParameterData.none(),
  'favoris': ParameterData.none(),
  'Accueil': (data) async => ParameterData(
        allParams: {
          'parain': getParameter<bool>(data, 'parain'),
          'parainref': getParameter<DocumentReference>(data, 'parainref'),
        },
      ),
  'Onboarding3': ParameterData.none(),
  'moyenPaiement': (data) async => ParameterData(
        allParams: {
          'refComm': getParameter<DocumentReference>(data, 'refComm'),
          'prod': getParameter<DocumentReference>(data, 'prod'),
        },
      ),
  'commandesPayee': ParameterData.none(),
  'cart2': ParameterData.none(),
  'mesCommandes': (data) async => ParameterData(
        allParams: {
          'gro': getParameter<DocumentReference>(data, 'gro'),
        },
      ),
  'Tracking': (data) async => ParameterData(
        allParams: {
          'refTrack': getParameter<DocumentReference>(data, 'refTrack'),
        },
      ),
  'listePanier': (data) async => ParameterData(
        allParams: {
          'refPanier': getParameter<DocumentReference>(data, 'refPanier'),
        },
      ),
  'Signature': (data) async => ParameterData(
        allParams: {
          'refTrack': getParameter<DocumentReference>(data, 'refTrack'),
        },
      ),
  'connexion': ParameterData.none(),
  'onBoarding4': ParameterData.none(),
  'Inscription': ParameterData.none(),
  'ToutesAttributions': ParameterData.none(),
  'AjoutPlat': ParameterData.none(),
  'Motdepasseoublier': ParameterData.none(),
  'profile': ParameterData.none(),
  'editprofile': ParameterData.none(),
  'changerMdp': ParameterData.none(),
  'allchat': ParameterData.none(),
  'category': ParameterData.none(),
  'pourVous': ParameterData.none(),
  'nosRecommandations': ParameterData.none(),
  'Reduction': (data) async => ParameterData(
        allParams: {
          'refPanier': getParameter<DocumentReference>(data, 'refPanier'),
        },
      ),
  'catDetails': (data) async => ParameterData(
        allParams: {
          'refcat': getParameter<DocumentReference>(data, 'refcat'),
          'refDet': getParameter<DocumentReference>(data, 'refDet'),
        },
      ),
  'livreur': ParameterData.none(),
  'cartes': (data) async => ParameterData(
        allParams: {
          'gro': getParameter<DocumentReference>(data, 'gro'),
          'precomm': getParameter<DocumentReference>(data, 'precomm'),
        },
      ),
  'Abonnement': ParameterData.none(),
  'historiqueLivraison': ParameterData.none(),
  'allHistoriqueLivraison': ParameterData.none(),
  'catDetails2': (data) async => ParameterData(
        allParams: {
          'refcat': getParameter<DocumentReference>(data, 'refcat'),
          'refDet': getParameter<DocumentReference>(data, 'refDet'),
        },
      ),
  'Ravitaillemant': ParameterData.none(),
  'AjoutPlat2': ParameterData.none(),
  'restauDetail': (data) async => ParameterData(
        allParams: {
          'ref': getParameter<DocumentReference>(data, 'ref'),
        },
      ),
  'restaurants': ParameterData.none(),
  'pourVousresto': (data) async => ParameterData(
        allParams: {
          'res': getParameter<DocumentReference>(data, 'res'),
        },
      ),
  'profilResto': ParameterData.none(),
  'lesmieuNote': (data) async => ParameterData(
        allParams: {
          'res': getParameter<DocumentReference>(data, 'res'),
        },
      ),
  'categoryplat': (data) async => ParameterData(
        allParams: {
          'res': getParameter<DocumentReference>(data, 'res'),
          'cat': getParameter<DocumentReference>(data, 'cat'),
        },
      ),
  'meilleurrestaurants': (data) async => ParameterData(
        allParams: {
          'res': getParameter<DocumentReference>(data, 'res'),
          'cat': getParameter<DocumentReference>(data, 'cat'),
        },
      ),
  'restaurantsmieuxNote': (data) async => ParameterData(
        allParams: {
          'res': getParameter<DocumentReference>(data, 'res'),
          'cat': getParameter<DocumentReference>(data, 'cat'),
        },
      ),
  'zone': (data) async => ParameterData(
        allParams: {
          'zone': getParameter<String>(data, 'zone'),
        },
      ),
  'restoMenu': ParameterData.none(),
  'parrain': (data) async => ParameterData(
        allParams: {
          'refparain': await getDocumentParameter<ParainRecord>(
              data, 'refparain', ParainRecord.fromSnapshot),
          'ref': getParameter<DocumentReference>(data, 'ref'),
        },
      ),
  'commandesnonPai': ParameterData.none(),
  'historiqueWallet': ParameterData.none(),
  'chatMain': ParameterData.none(),
  'chatDetails': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'dettes': ParameterData.none(),
  'dispo': ParameterData.none(),
  'restoall': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
