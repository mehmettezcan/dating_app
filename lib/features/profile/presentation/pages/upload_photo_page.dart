import 'dart:io';

import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/utils/widgets/button.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:dating_app/router.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).profileDetail,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).uploadYourPhoto,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).uploadPhotoHint,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Fotoğraf kutusu
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (_, state) {
                    if (state is ProfileLoading) {
                      return const SizedBox(
                        width: 180,
                        height: 180,
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      );
                    }

                    String? uploadedFileUrl;
                    if (state is PhotoUploadSuccess) {
                      uploadedFileUrl = state.fileUrl;
                    }

                    return GestureDetector(
                      onTap: () async {
                        ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((pickedFile) {
                              debugPrint("Picked file: ${pickedFile?.path}");
                              debugPrint("Picked file: ${pickedFile?.path}");
                              debugPrint("Picked file: ${pickedFile?.path}");

                              if (pickedFile != null) {
                                final file = File(pickedFile.path);
                                if (!mounted) return;
                                context.read<ProfileBloc>().add(
                                  UploadPhotoEvent(file),
                                );
                              }
                            });
                      },
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B2B2B),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white24),
                          image:
                              uploadedFileUrl != null
                                  ? DecorationImage(
                                    image: NetworkImage(uploadedFileUrl),
                                    fit: BoxFit.cover,
                                  )
                                  : null,
                        ),
                        child:
                            uploadedFileUrl == null
                                ? const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 32,
                                  ),
                                )
                                : null,
                      ),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            AppButton(
              text: S.of(context).continueText,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteGenerator.profileScreen,
                  (route) => false,
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
