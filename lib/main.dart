
import 'package:blog_app/core/base/styles/auth_theme.dart';
import 'package:blog_app/core/base/styles/chat_theme.dart';
import 'package:blog_app/core/base/styles/global_users_theme.dart';
import 'package:blog_app/core/base/styles/home_theme.dart';
import 'package:blog_app/core/base/styles/profile_theme.dart';
import 'package:blog_app/features/posts/presentation/views/create_post_view.dart';
import 'blogging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(
    cloudName: 'dyn1z1hjj',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileSettingsNotifier()),
        ChangeNotifierProvider(create: (context) => PostCommentNotifier()),
        ChangeNotifierProvider(create: (context) => HomeUserProfileNotifier()),
        ChangeNotifierProvider(create: (context) => NotificationNotifier()),
        ChangeNotifierProvider(create: (context) => HomePostNotifier()),
        ChangeNotifierProvider(create: (context) => AuthErrorNotifier()),
        Provider<PostsRepository>(
          create: (context) => FirebasePostsRepository(),
        ),
        ProxyProvider<PostsRepository, PostsUseCases>(
          update: (context, postsRepository, previous) =>
              PostsUseCases(postsRepository),
        ),
        ProxyProvider<PostsUseCases, PostsNotifier>(
          update: (context, postsUseCases, previous) =>
              PostsNotifier(postsUseCases),
        ),
        Provider<NotificationsRepository>(
          create: (context) => FirebaseNotificationsRepository(),
        ),
        ProxyProvider<NotificationsRepository, NotificationsUseCases>(
          update: (context, notificationsRepository, previous) =>
              NotificationsUseCases(notificationsRepository),
        ),
        ProxyProvider<NotificationsUseCases, NotificationsNotifier>(
          update: (context, notificationsUseCases, previous) =>
              NotificationsNotifier(notificationsUseCases),
        ),
        Provider<ChatsRepository>(
          create: (context) => FirebaseChatsRepository(),
        ),
        ProxyProvider<ChatsRepository, ChatsUseCases>(
          update: (context, chatsRepository, previous) =>
              ChatsUseCases(chatsRepository),
        ),
        ProxyProvider<ChatsUseCases, ChatsNotifier>(
          update: (context, chatsUseCases, previous) =>
              ChatsNotifier(chatsUseCases),
        ),
        Provider<GlobalUsersRepository>(
          create: (context) => FirebaseGlobalUsersRepository(),
        ),
        ProxyProvider<GlobalUsersRepository, GlobalUsersUseCases>(
          update: (context, globalUsersRepository, previous) =>
              GlobalUsersUseCases(globalUsersRepository),
        ),
        ProxyProvider<GlobalUsersUseCases, GlobalUsersNotifier>(
          update: (context, globalUsersUseCases, previous) =>
              GlobalUsersNotifier(globalUsersUseCases),
        ),
        Provider<ProfileRepository>(
          create: (context) => FirebaseProfileRepository(),
        ),
        ProxyProvider<ProfileRepository, ProfileUseCases>(
          update: (context, profileRepository, previous) =>
              ProfileUseCases(profileRepository),
        ),
        ProxyProvider<ProfileUseCases, ProfileNotifier>(
          update: (context, profileUseCases, previous) =>
              ProfileNotifier(profileUseCases),
        ),
        Provider<HomeRepository>(
          create: (context) => FirebaseHomeRepository(),
        ),
        ProxyProvider<HomeRepository, HomeUseCases>(
          update: (context, homeRepository, previous) =>
              HomeUseCases(homeRepository),
        ),
        ProxyProvider<HomeUseCases, HomeNotifier>(
          update: (context, homeUseCases, previous) =>
              HomeNotifier(homeUseCases),
        ),
        Provider<AuthRepository>(
          create: (context) => FirebaseAuthRepository(FirebaseAuth.instance),
        ),
        ProxyProvider<AuthRepository, LoginUserUseCase>(
          update: (context, authRepository, previous) =>
              LoginUserUseCase(authRepository),
        ),
        ProxyProvider<AuthRepository, SignUpUserUseCase>(
          update: (context, authRepository, previous) =>
              SignUpUserUseCase(authRepository),
        ),
        ProxyProvider2<LoginUserUseCase, SignUpUserUseCase, AuthNotifier>(
          update: (context, loginUseCase, signUpUseCase, previous) =>
              AuthNotifier(loginUseCase, signUpUseCase),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        extensions: const <ThemeExtension<dynamic>>[
          AuthTheme(
            authButtonColor: Color(0xFF88C4D4),
            authButtonTextStyle: TextStyle(color: Colors.white, fontSize: 19),
            authErrorTextStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            authButtonRadius: BorderRadius.all(Radius.circular(12)),
            authFieldRadius: BorderRadius.all(Radius.circular(30)),
          ),
          ChatTheme(
            legacyChatBackgroundColor: Color(0xFF424242),
          ),
          GlobalUsersTheme(
            chatWithSenderSendIconColor: Colors.blue,
            chatWithSenderLabelTextStyle: TextStyle(fontSize: 13),
            chatWithSenderNameTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            chatWithSenderMessageTextStyle: TextStyle(fontSize: 13.2),
          ),
          HomeTheme(
            homeScaffoldBackgroundColor: Color(0xFFE1E3E6),
            homeAppBarBackgroundColor: Colors.white,
            homeSectionBackgroundColor: Colors.white,
            homePostCardBackgroundColor: Color(0xFFFEFBFB),
            homeSnackBarBackgroundColor: Colors.black,
            homeCommentSheetBackgroundColor: Colors.white,
            homeCommentSheetHandleColor: Color(0xFFE0E0E0),
            homeCommentSendIconColor: Colors.blue,
            homeUserActionFollowingColor: Colors.green,
            homeUserActionPrimaryColor: Colors.brown,
            homeUserActionIconColor: Colors.white,
            homeStatDividerColor: Color(0xFFA19F9F),
            homePostCardRadius: BorderRadius.all(Radius.circular(30)),
            homePostImageRadius: BorderRadius.all(Radius.circular(16)),
            homeActionButtonRadius: BorderRadius.all(Radius.circular(16)),
            homeCommentSheetRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            homeCommentSheetHandleRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            homeMemberSinceTextStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
            homePostTimestampTextStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
            homePostBodyTextStyle: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
            ),
            homeStatLabelTextStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
            homeActionButtonTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          ProfileTheme(
            profileSectionBackgroundColor: Colors.white,
            profileActionButtonColor: Colors.brown,
            profileActionIconColor: Colors.white,
            profileSettingsBorderColor: Color(0xFF8E8C8C),
            profileStatDividerColor: Color(0xFFA19F9F),
            profileActionButtonRadius: BorderRadius.all(Radius.circular(16)),
            profileSettingsBorderRadius: BorderRadius.all(Radius.circular(15)),
            profileMemberSinceTextStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
            profileActionButtonTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            profileMessageButtonTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            profileStatLabelTextStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          if (snapshot.data != null) {
            return ProfileView();
          }
          return LoginView();
        },
      ),
      routes: {
        loginRoute: (context) => LoginView(),
        signUpRoute: (context) => SignUp(),
        profileRoute: (context) => ProfileView(),
        profileSettingsRoute: (context) => ProfileSettings(),
        createPostRoute: (context) => CreatePost(),
        homeRoute: (context) => HomeView(),
        homeUserRoute: (context) => HomeUserView(),
        notificationsRoute: (context) => UserNotification(),
        updatePostRoute: (context) => UpdatePost(),
        followerViewRoute: (context) => FollowersView(),
        messagesRoute: (context) => MessagesView(),
        chatWithSenderRoute: (context) => ChatWithSenderView(),
        postCommentNotificationRoute: (context) =>
            UserPostCommentNotification(),
        profileUpdateRoute: (context) => ProfileUpdate(),
        globalChatRoute: (context) => GlobalChatView(),
      },
    );
  }
}
