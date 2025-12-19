import 'package:go_router/go_router.dart';

import '../features/authentication/signin/signin_screen.dart';
import '../features/create_journal/presentation/create_journal_screen.dart';
import '../features/edit_journal/edit_journaal_screen.dart';
import '../features/journal_details/journal_details_scren.dart';
import '../features/journal_home/journal_home_screen.dart';

class AppRoutes {
  AppRoutes._(); // private constructor

  // Route names
  static const String signinScreen = '/signinScreen';
  static const String journalHomeScreen = '/journalHomeScreen';
  static const String createJournalScreen = '/createJournalScreen';
  static const String editJournalScreen = '/editJournalScreen';
  static const String journalCardDetailsScreen = '/journalCardDetailsScreen';

  // GoRouter instance
  static final GoRouter router = GoRouter(
    initialLocation: journalHomeScreen,
    routes: [
      GoRoute(
        path: signinScreen,
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: journalHomeScreen,
        builder: (context, state) => const JournalHomeScreen(),
      ),
      GoRoute(
        path: createJournalScreen,
        builder: (context, state) => const CreateJournalScreen(),
      ),
      GoRoute(
        path: journalCardDetailsScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return JournalCardDetailsScreen(
            index: data['index'],
            createJournalModel: data['journal'],
          );
        },
      ),

      GoRoute(
        path: editJournalScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return EditJournalScreen(
            index: data['index'],
            createJournalModel: data['journal'],
          );
        },
      ),
    ],
  );
}
