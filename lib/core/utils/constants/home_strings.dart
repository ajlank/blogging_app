class HomeStrings {
  static const String loading = 'Loading';
  static const String loadingEllipsis = 'Loading..';
  static const String pleaseLoginAgain = 'Please login again';
  static const String updateProfilePrompt =
      'Please update your profile and navigate to this view';
  static const String updateProfile = 'Update profile';
  static const String postedOnPrefix = 'Posted on';
  static const String delete = 'delete';
  static const String update = 'update';
  static const String about = 'About';
  static const String totalPosts = 'Total Posts';
  static const String followers = 'Followers';
  static const String reactions = 'Reactions';
  static const String following = 'Following';
  static const String follow = 'Follow';
  static const String chat = 'Chat';
  static const String noCommentsYet = 'No comments yet.';
  static const String addCommentHint = 'Add a comment...';
  static const String postDeleted = 'post deleted';
  static const String memberSince = 'Member since Dec 2024';
  static const String yourNameFallback = 'Your name';

  static String unfollowedUser(String name) =>
      'Successfully unfollowed $name';
  static String nowFollowing(String name) => 'You are now following $name';

  const HomeStrings._();
}
