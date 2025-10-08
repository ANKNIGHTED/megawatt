import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/controller/services/authenticationServices/authenticationServices.dart';
import 'package:megawatt/controller/services/authenticationServices/firestore.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final User? _currentUser = Authenticationservices().getCurrentUser();
  final FirestoreServices _db = FirestoreServices();

  String _username = "User's name";
  String? _profileImageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load the custom username and existing image URL from Firestore
  Future<void> _loadUserData() async {
    if (_currentUser == null) return;

    final doc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_currentUser!.uid)
            .get();

    if (doc.exists && doc.data() != null) {
      setState(() {
        _username = doc.data()?['username'] ?? "Guest User";
        _profileImageUrl = doc.data()?['profilePictureUrl'];
      });
    } else {
      _username = _currentUser?.displayName ?? "Guest User";
    }
  }

  Future<void> _pickAndUploadImage() async {
    if (_currentUser == null || _isLoading) return;

    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _isLoading = true;
      });

      try {
        final newUrl = await _db.uploadProfilePicture(
          _currentUser!.uid,
          pickedFile.path,
        );

        setState(() {
          _profileImageUrl = newUrl;
        });
      } catch (e) {
        debugPrint('Image upload failed: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  List profile = [
    [Icons.shop, 'Orders', '/Orders'],

    [Icons.help, 'Help', '/Help'],
    [Icons.wallet, 'Wallet', '/Wallet'],
    [Icons.settings, 'Settings', '/Settings'],
    [Icons.logout, 'Sign Out', '/SignInLogic'],
  ];

  void _handleTap(BuildContext context, String route) {
    if (route == 'logout') {
      final _authService = Authenticationservices();
      _authService.signOut();
    } else {
      // Use pushNamed for all defined pages
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get user display name (or a placeholder)
    final String userName = _currentUser?.displayName ?? "Guest User";
    // Get user photo URL (or null if not available)
    final String? photoUrl = _currentUser?.photoURL;
    final ImageProvider? imageProvider =
        _profileImageUrl != null
            ? NetworkImage(_profileImageUrl!) // Show uploaded image
            : null;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),

          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 8.h,
                      backgroundColor: AppColors.primaryPurple,
                      backgroundImage:
                          imageProvider, // Use NetworkImage if URL exists
                      child:
                          imageProvider == null &&
                                  !_isLoading // Fallback icon if no image
                              ? Icon(
                                Icons.person,
                                size: 10.h,
                                color: Colors.white,
                              )
                              : null,
                    ),
                    if (_isLoading)
                      Positioned.fill(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap:
                            _pickAndUploadImage, // Trigger the upload process
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /*
                CircleAvatar(
                  radius: 8.h,
                  backgroundColor: AppColors.primaryPurple,
                  backgroundImage: imageProvider,
                  child: CircleAvatar(
                    child: Icon(Icons.person, size: 10.h),
                    radius: 8.h - 2,
                  ),
                ),
                */
                SizedBox(width: 2.h),
                // Text("User's name", style: AppTextStyles.heading2(context)),
                Text(_username, style: AppTextStyles.heading2(context)),
              ],
            ),
            SizedBox(height: 4.h),
            ListView.builder(
              itemCount: profile.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = profile[index];
                final IconData icon = item[0];
                final String title = item[1];
                final String route = item[2];
                return ListTile(
                  leading: Icon(profile[index][0], size: 3.h),
                  title: Text(
                    title,
                    //profile[index][1],
                    style: AppTextStyles.subheading(context),
                  ),
                  onTap: () {
                    _handleTap(context, route);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
