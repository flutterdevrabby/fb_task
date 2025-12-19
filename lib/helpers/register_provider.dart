import 'package:provider/provider.dart';
import '../providers/create_journal_provider.dart';
import '../providers/sign_in_provider.dart';

var registerProvider = [
  ChangeNotifierProvider<SignInProvider>(
    create: ((context) => SignInProvider()),
  ),
  ChangeNotifierProvider<CreateJournalProvider>(
    create: ((context) => CreateJournalProvider()),
  ),
];
