class Constants {
  Constants._();

  static const empty = '';
  static const unknownDevice = 'Unknown device';
  static const String baseUrl = 'https://rfid.octadot.net';
  //static const String baseUrl2 = 'http://192.168.1.207/sight_guard_admin';

  static const String welcomeNote = ""
      "With SightGuard, "
      "visually impaired individuals can confidently carry out "
      "transactions using their credit card. \n\nLet's get started "
      "on your journey to effortless banking";

  static const String onboardInstruction = ''
      'For instructions on how to use this app, single-tap your screen. '
      'To skip and continue using the app, double-tap your screen';

  static const String onboardInstruction2 = ''
      'For user verification page instructions,'
      'single-tap your screen. For payment verification page instructions, '
      'double-tap your screen.';
  static const String userVerificationInstruction = ''
      '1. On the first page, which is the user verification page, '
      'you are required to provide your ID number, which is part of your user ID.'
      'To get a user ID, kindly register on the SightGuard website with your RFID card.'
      '2. You can always tap on your screen once inorder to restart the user ID verification process.'
      '3. Please NOTE that you cannot authorize transactions using this app until your user ID '
      'is verified and linked to your SightGuard account successfully.';
  static const String transactionVerificationInstruction = ''
      '1. After a successful user ID verification, '
      'the app will be able to detect when there is a pending transaction on your account. '
      '2. To cancel or Pause the request to authorize any transaction, you can single-tap on the screen'
      'and reply stop afterwards; but this temporarily pauses the app.'
      '3. To sign-out of the app, you can as well reply sign-out.'
      'NOTE that doing this will delete all your data stored in the app and '
      'will unlink them from the SightGuard database.';
  static const String recapOrExit = ''
      'To listen again, single-tap. To exit, double-tap.';
  static const String finalInstructions = ''
      'Please NOTE that for an effective and smooth performance, '
      'this app requires a strong internet connection for the the voice and '
      'speech commands and interaction with the server. With poor network connection,'
      'unexpected voice and speech results may be encountered.';

  static const String userVerificationInstruction2 = ''
      'For payment verification page instructions,'
      'single-tap your screen. To continue to the final instructions, '
      'double-tap your screen.';

  static const String transactionVerificationInstruction2 = ''
      'To continue to the final instructions,'
      'single-tap your screen. To listen to the entire instruction again, '
      'double-tap your screen.';

  static const String finalInstructions2 = ''
  'You have successfully completed the app\'s onboarding session. To continue to verify your ID, '
      'single-tap or double-tap your screen.';

  static const String transactionVerificationPrompt = ''
      'Please which action do you wish to perform? '
      'To Pause app, respond with: "STOP". '
      'To Sign out, respond with: "SIGN OUT".';
  static const String appPaused = ''
      'App is Paused, Touch anywhere on the screen to restart!';
  static const String uIDPrefix = 'SG_';
  static const String uIDQuery = ''
      'Please what is your ID number, that is, '
      'the number after "SG_" in your user ID?';
  static const String guidelines = ''
      'Please which action do you wish to perform? '
      'To Pause app, respond with: "STOP". '
      'To Sign out, respond with: "SIGN OUT".';
  static const String pendingTransactionCheck = ''
      'Checking for any pending transaction on your account...';
}