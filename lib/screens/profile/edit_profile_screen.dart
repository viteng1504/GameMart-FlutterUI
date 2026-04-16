import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildEditHeader(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("First Name", "Sabrina"),
                  _buildTextField("Last Name", "Aryan"),
                  _buildTextField("Username", "@Sabrina"),
                  _buildTextField("Email", "@SabrinaAry208@gmailcom"),
                  _buildTextField("Phone Number", "+234 904 6470"),
                  _buildDropdownField("Birth"),
                  _buildDropdownField("Gender"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: [],
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildEditHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(height: 150, color: Colors.blue[200]), // Gradient placeholder
        const Positioned(
          bottom: 10,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ),
      ],
    );
  }
}
