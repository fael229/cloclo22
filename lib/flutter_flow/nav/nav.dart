import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child:
            appStateNotifier.loggedIn ? AccueilWidget() : Onboarding1Widget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? AccueilWidget() : Onboarding1Widget(),
          routes: [
            FFRoute(
              name: 'Onboarding1',
              path: 'onboarding1',
              builder: (context, params) => Onboarding1Widget(),
            ),
            FFRoute(
              name: 'user',
              path: 'user',
              builder: (context, params) => UserWidget(),
            ),
            FFRoute(
              name: 'Onboarding2',
              path: 'onboarding2',
              builder: (context, params) => Onboarding2Widget(),
            ),
            FFRoute(
              name: 'favoris',
              path: 'favoris',
              builder: (context, params) => FavorisWidget(),
            ),
            FFRoute(
              name: 'Accueil',
              path: 'accueil',
              requireAuth: true,
              builder: (context, params) => AccueilWidget(
                parain: params.getParam('parain', ParamType.bool),
                parainref: params.getParam('parainref',
                    ParamType.DocumentReference, false, ['parain']),
              ),
            ),
            FFRoute(
              name: 'Onboarding3',
              path: 'onboarding3',
              builder: (context, params) => Onboarding3Widget(),
            ),
            FFRoute(
              name: 'moyenPaiement',
              path: 'moyenPaiement',
              builder: (context, params) => MoyenPaiementWidget(
                refComm: params.getParam('refComm', ParamType.DocumentReference,
                    false, ['precommande']),
                prod: params.getParam(
                    'prod', ParamType.DocumentReference, false, ['produits']),
              ),
            ),
            FFRoute(
              name: 'commandesPayee',
              path: 'commandesPayee',
              builder: (context, params) => CommandesPayeeWidget(),
            ),
            FFRoute(
              name: 'cart2',
              path: 'cart2',
              requireAuth: true,
              builder: (context, params) => Cart2Widget(),
            ),
            FFRoute(
              name: 'mesCommandes',
              path: 'mesCommandes',
              builder: (context, params) => MesCommandesWidget(
                gro: params.getParam(
                    'gro', ParamType.DocumentReference, false, ['ride']),
              ),
            ),
            FFRoute(
              name: 'Tracking',
              path: 'tracking',
              builder: (context, params) => TrackingWidget(
                refTrack: params.getParam('refTrack',
                    ParamType.DocumentReference, false, ['precommande']),
              ),
            ),
            FFRoute(
              name: 'listePanier',
              path: 'listePanier',
              builder: (context, params) => ListePanierWidget(
                refPanier: params.getParam('refPanier',
                    ParamType.DocumentReference, false, ['precommande']),
              ),
            ),
            FFRoute(
              name: 'Signature',
              path: 'signature',
              builder: (context, params) => SignatureWidget(
                refTrack: params.getParam('refTrack',
                    ParamType.DocumentReference, false, ['precommande']),
              ),
            ),
            FFRoute(
              name: 'connexion',
              path: 'connexion',
              builder: (context, params) => ConnexionWidget(),
            ),
            FFRoute(
              name: 'onBoarding4',
              path: 'onBoarding4',
              builder: (context, params) => OnBoarding4Widget(),
            ),
            FFRoute(
              name: 'Inscription',
              path: 'inscription',
              builder: (context, params) => InscriptionWidget(),
            ),
            FFRoute(
              name: 'ToutesAttributions',
              path: 'toutesAttributions',
              builder: (context, params) => ToutesAttributionsWidget(),
            ),
            FFRoute(
              name: 'AjoutPlat',
              path: 'ajoutPlat',
              builder: (context, params) => AjoutPlatWidget(),
            ),
            FFRoute(
              name: 'Motdepasseoublier',
              path: 'motdepasseoublier',
              builder: (context, params) => MotdepasseoublierWidget(),
            ),
            FFRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, params) => ProfileWidget(),
            ),
            FFRoute(
              name: 'editprofile',
              path: 'editprofile',
              builder: (context, params) => EditprofileWidget(),
            ),
            FFRoute(
              name: 'changerMdp',
              path: 'changerMdp',
              builder: (context, params) => ChangerMdpWidget(),
            ),
            FFRoute(
              name: 'allchat',
              path: 'allchat',
              builder: (context, params) => AllchatWidget(),
            ),
            FFRoute(
              name: 'category',
              path: 'category',
              builder: (context, params) => CategoryWidget(),
            ),
            FFRoute(
              name: 'pourVous',
              path: 'pourVous',
              builder: (context, params) => PourVousWidget(),
            ),
            FFRoute(
              name: 'nosRecommandations',
              path: 'nosRecommandations',
              builder: (context, params) => NosRecommandationsWidget(),
            ),
            FFRoute(
              name: 'Reduction',
              path: 'reduction',
              builder: (context, params) => ReductionWidget(
                refPanier: params.getParam('refPanier',
                    ParamType.DocumentReference, false, ['precommande']),
              ),
            ),
            FFRoute(
              name: 'catDetails',
              path: 'catDetails',
              builder: (context, params) => CatDetailsWidget(
                refcat: params.getParam(
                    'refcat', ParamType.DocumentReference, false, ['cat']),
                refDet: params.getParam('refDet', ParamType.DocumentReference,
                    false, ['cat', 'Details']),
              ),
            ),
            FFRoute(
              name: 'livreur',
              path: 'livreur',
              requireAuth: true,
              builder: (context, params) => LivreurWidget(),
            ),
            FFRoute(
              name: 'cartes',
              path: 'cartes',
              builder: (context, params) => CartesWidget(
                gro: params.getParam(
                    'gro', ParamType.DocumentReference, false, ['ride']),
                precomm: params.getParam('precomm', ParamType.DocumentReference,
                    false, ['precommande']),
              ),
            ),
            FFRoute(
              name: 'Abonnement',
              path: 'abonnement',
              builder: (context, params) => AbonnementWidget(),
            ),
            FFRoute(
              name: 'historiqueLivraison',
              path: 'historiqueLivraison',
              builder: (context, params) => HistoriqueLivraisonWidget(),
            ),
            FFRoute(
              name: 'allHistoriqueLivraison',
              path: 'allHistoriqueLivraison',
              builder: (context, params) => AllHistoriqueLivraisonWidget(),
            ),
            FFRoute(
              name: 'catDetails2',
              path: 'catDetails2',
              builder: (context, params) => CatDetails2Widget(
                refcat: params.getParam(
                    'refcat', ParamType.DocumentReference, false, ['cat']),
                refDet: params.getParam('refDet', ParamType.DocumentReference,
                    false, ['cat', 'Details']),
              ),
            ),
            FFRoute(
              name: 'Ravitaillemant',
              path: 'ravitaillemant',
              builder: (context, params) => RavitaillemantWidget(),
            ),
            FFRoute(
              name: 'AjoutPlat2',
              path: 'ajoutPlat2',
              builder: (context, params) => AjoutPlat2Widget(),
            ),
            FFRoute(
              name: 'restauDetail',
              path: 'restauDetail',
              requireAuth: true,
              builder: (context, params) => RestauDetailWidget(
                ref: params.getParam(
                    'ref', ParamType.DocumentReference, false, ['restaurants']),
              ),
            ),
            FFRoute(
              name: 'restaurants',
              path: 'restaurants',
              builder: (context, params) => RestaurantsWidget(),
            ),
            FFRoute(
              name: 'pourVousresto',
              path: 'pourVousresto',
              builder: (context, params) => PourVousrestoWidget(
                res: params.getParam(
                    'res', ParamType.DocumentReference, false, ['restaurants']),
              ),
            ),
            FFRoute(
              name: 'profilResto',
              path: 'profilResto',
              builder: (context, params) => ProfilRestoWidget(),
            ),
            FFRoute(
              name: 'lesmieuNote',
              path: 'lesmieuNote',
              builder: (context, params) => LesmieuNoteWidget(
                res: params.getParam(
                    'res', ParamType.DocumentReference, false, ['restaurants']),
              ),
            ),
            FFRoute(
              name: 'categoryplat',
              path: 'categoryplat',
              builder: (context, params) => CategoryplatWidget(
                res: params.getParam(
                    'res', ParamType.DocumentReference, false, ['restaurants']),
                cat: params.getParam(
                    'cat', ParamType.DocumentReference, false, ['cat']),
              ),
            ),
            FFRoute(
              name: 'meilleurrestaurants',
              path: 'meilleurrestaurants',
              builder: (context, params) => MeilleurrestaurantsWidget(
                res: params.getParam(
                    'res', ParamType.DocumentReference, false, ['restaurants']),
                cat: params.getParam(
                    'cat', ParamType.DocumentReference, false, ['cat']),
              ),
            ),
            FFRoute(
              name: 'restaurantsmieuxNote',
              path: 'restaurantsmieuxNote',
              builder: (context, params) => RestaurantsmieuxNoteWidget(
                res: params.getParam(
                    'res', ParamType.DocumentReference, false, ['restaurants']),
                cat: params.getParam(
                    'cat', ParamType.DocumentReference, false, ['cat']),
              ),
            ),
            FFRoute(
              name: 'zone',
              path: 'zone',
              builder: (context, params) => ZoneWidget(
                zone: params.getParam('zone', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'restoMenu',
              path: 'restoMenu',
              builder: (context, params) => RestoMenuWidget(),
            ),
            FFRoute(
              name: 'parrain',
              path: 'parrain',
              asyncParams: {
                'refparain': getDoc(['parain'], ParainRecord.fromSnapshot),
              },
              builder: (context, params) => ParrainWidget(
                refparain: params.getParam('refparain', ParamType.Document),
                ref: params.getParam(
                    'ref', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'commandesnonPai',
              path: 'commandesnonPai',
              builder: (context, params) => CommandesnonPaiWidget(),
            ),
            FFRoute(
              name: 'historiqueWallet',
              path: 'historiqueWallet',
              builder: (context, params) => HistoriqueWalletWidget(),
            ),
            FFRoute(
              name: 'chatMain',
              path: 'chatMain',
              builder: (context, params) => ChatMainWidget(),
            ),
            FFRoute(
              name: 'chatDetails',
              path: 'chatDetails',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatDetailsWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'dettes',
              path: 'dettes',
              builder: (context, params) => DettesWidget(),
            ),
            FFRoute(
              name: 'dispo',
              path: 'dispo',
              builder: (context, params) => DispoWidget(),
            ),
            FFRoute(
              name: 'restoall',
              path: 'restoall',
              builder: (context, params) => RestoallWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link?request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
