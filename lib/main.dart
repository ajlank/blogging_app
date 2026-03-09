
import 'package:blog_app/features/posts/presentation/views/create_post_view.dart';
import 'package:blog_app/features/profile/presentation/views/profile_settings_view.dart';
import 'package:blog_app/views/user_profile_settings/profile_update.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
