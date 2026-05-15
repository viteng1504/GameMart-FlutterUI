import 'dart:ui';

import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static const Color _topColor = Color(0xFF252D4B);
  static const Color _bodyColor = Color(0xFFF1EFEA);
  static const Color _cyan = Color(0xFF08E8DE);
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: _topColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(height: 130, color: _topColor),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: _bodyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 88),
                    child: Column(
                      children: [
                        _buildAvatar(),
                        const SizedBox(height: 10),
                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 58),
                          child: Column(
                            children: [
                              _buildTextField("First Name", "Sabrina"),
                              _buildTextField("Last Name", "Aryan"),
                              _buildTextField("Username", "@Sabrina"),
                              _buildTextField(
                                "Email",
                                "@SabrinaAry208@gmail.com",
                              ),
                              _buildTextField("Phone Number", "+234     904 6470"),
                              _buildDropdownField("Birth"),
                              _buildDropdownField("Gender"),
                              const SizedBox(height: 22),
                              SizedBox(
                                width: double.infinity,
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: () => _showSuccessPopup(context),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: _cyan,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    "Update",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: _buildBottomNav(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 12, 30, 0),
      child: Row(
        children: [
          const Text(
            "09:41",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(Icons.signal_cellular_alt, color: Colors.white, size: 12),
          const SizedBox(width: 3),
          const Icon(Icons.wifi, color: Colors.white, size: 12),
          const SizedBox(width: 3),
          Container(
            width: 13,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    const String kProfileImage =
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=800&q=80';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          radius: 39,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(kProfileImage),
          ),
        ),
        Positioned(
          right: -2,
          bottom: 7,
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Color(0xFF1D6291),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 9,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 7,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 21,
            child: TextFormField(
              initialValue: initialValue,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black, width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black, width: 0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
        height: 22,
        child: DropdownButtonFormField<String>(
          initialValue: null,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
            size: 16,
          ),
          style: const TextStyle(
            fontSize: 8,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
              fontSize: 8,
              color: Colors.black54,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.only(
              left: 8,
              right: 6,
              top: 2,
              bottom: 2,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.black, width: 0.7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.black, width: 0.8),
            ),
          ),
          items: const [
            DropdownMenuItem(value: "1", child: Text("Option 1")),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 54,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.dashboard_rounded, false),
          _navItem(Icons.shopping_cart_rounded, false),
          _navItem(Icons.home_rounded, false),
          _navItem(Icons.layers_rounded, false),
          _navItem(Icons.person_rounded, true),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, bool active) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: active ? Colors.white : Colors.black,
        size: 18,
      ),
    );
  }

  void _showSuccessPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Profile updated",
      barrierColor: Colors.white.withOpacity(0.15),
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            Center(
              child: Container(
                width: 168,
                height: 143,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF6A91F2),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Color(0xFF6A91F2),
                        size: 25,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "PROFILE UPDATED",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.2,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}