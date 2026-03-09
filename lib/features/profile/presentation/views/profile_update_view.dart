import 'dart:io';
import 'package:blog_app/features/profile/presentation/controllers/profile_notifier.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_image_picker_box.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_settings_form_fields.dart';
import 'package:blog_app/features/profile/presentation/widgets/profile_settings_save_button.dart';
import 'package:blog_app/utils/constants/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  late final TextEditingController _titleController;
  late final TextEditingController _aboutController;
  String docId = '';
  File? coverFile;
  File? profile;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    docId = args['docId'];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _aboutController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    await context.read<ProfileNotifier>().updateProfileSettings(
      docId: docId,
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: _titleController.text.trim(),
      about: _aboutController.text.trim(),
      coverFile: coverFile,
      profileFile: profile,
    );
    GetStorage().write('userConfirmed', FirebaseAuth.instance.currentUser!.uid);
    Navigator.of(context).pushNamedAndRemoveUntil(profileRoute, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update profile')),
      body: Column(
        children: [
          ProfileImagePickerBox(
            title: 'Cover:',
            file: coverFile,
            onTap: () async {
              final image = await selectImage();
              setState(() {
                coverFile = image;
              });
            },
          ),
          ProfileImagePickerBox(
            title: 'Profile',
            file: profile,
            onTap: () async {
              final image = await selectImage();
              setState(() {
                profile = image;
              });
            },
          ),
          ProfileSettingsFormFields(
            nameController: _titleController,
            aboutController: _aboutController,
          ),
          ProfileSettingsSaveButton(onSave: _updateProfile),
        ],
      ),
    );
  }
}

Future<File?> selectImage() async {
  final imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    return File(file.path);
  }
  return null;
}
