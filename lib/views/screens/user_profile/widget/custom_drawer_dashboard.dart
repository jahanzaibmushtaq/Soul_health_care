import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/services/auth_services.dart';
import 'package:random_video_chat_app/services/local_storage_services.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key});

  void _logout() async {
    try {
      await AuthServices.authInstance.logout();
      await LocalStorageService.localStorageInstance.removeSession();
      Get.offAllNamed('/signInScreen');
      // You can also add additional sign out logic for other providers if needed
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo_icon.png', // Replace with your app logo asset path
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Soul HealthCare',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 11),
                const Text(
                  'Your Health, Our Priority',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Handle profile navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
