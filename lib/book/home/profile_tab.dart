import 'package:flutter/material.dart';
import 'package:readr/utils/constants/images.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProfileCard();
  }

  Widget _buildProfileCard() => Container(
margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.kProfile), fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Logout')))
                ],
              ),
            ),
          ),
        ),
  );
}
