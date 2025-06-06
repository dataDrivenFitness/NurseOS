import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.indigo,
            child: Text('J', style: TextStyle(fontSize: 32, color: Colors.white)),
          ),
          const SizedBox(height: 12),
          Text('Nurse Jamie', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          const Divider(),

          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDark,
            onChanged: (_) => ref.read(themeModeProvider.notifier).toggle(),
            secondary: const Icon(Icons.brightness_6),
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () {}, // placeholder
          ),
        ],
      ),
    );
  }
}
