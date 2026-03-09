import 'package:blog_app/controller/home_post_notifier.dart';
import 'package:blog_app/controller/home_user_profile_notifier.dart';
import 'package:blog_app/controller/notification_notifier.dart';
import 'package:blog_app/controller/post_comment_notifier.dart';
import 'package:blog_app/controller/profile_settings_notifier.dart';
import 'package:blog_app/firebase_options.dart';
import 'package:blog_app/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:blog_app/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:blog_app/features/auth/presentation/notifiers/auth_error_notifier.dart';
import 'package:blog_app/features/auth/presentation/views/login_view.dart';
import 'package:blog_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:blog_app/features/home/data/repositories/firebase_home_repository.dart';
import 'package:blog_app/features/home/domain/repositories/home_repository.dart';
import 'package:blog_app/features/home/domain/usecases/home_use_cases.dart';
import 'package:blog_app/features/home/presentation/controllers/home_notifier.dart';
import 'package:blog_app/features/home/presentation/views/home_view.dart';
import 'package:blog_app/utils/constants/app_routes.dart';
import 'package:blog_app/views/chat/global_chat_view.dart';
import 'package:blog_app/views/notifications/user_notification.dart';
import 'package:blog_app/views/notifications/user_post_comment_notification.dart';
import 'package:blog_app/views/profile_view.dart';
import 'package:blog_app/views/user_profile_settings/profile_settings.dart';
import 'package:blog_app/views/user_posts/create_post.dart';
import 'package:blog_app/views/user_posts/home_user_view.dart';
import 'package:blog_app/views/user_posts/update_post.dart';
import 'package:blog_app/views/user_profile_settings/profile_update.dart';
import 'package:blog_app/views/user_profile_settings/views/chat_with_sender_view.dart';
import 'package:blog_app/views/user_profile_settings/views/followers_view.dart';
import 'package:blog_app/views/user_profile_settings/views/messages_view.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

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
