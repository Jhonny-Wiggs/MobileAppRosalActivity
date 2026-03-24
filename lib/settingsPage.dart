import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _locationServices = true;
  bool _dataSync = false;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionHeader(title: 'Appearance', colorScheme: colorScheme),
        _ToggleTile(
          icon: Icons.dark_mode_outlined,
          label: 'Dark Mode',
          value: _darkMode,
          colorScheme: colorScheme,
          onChanged: (v) => setState(() => _darkMode = v),
        ),
        _NavigationTile(
          icon: Icons.language,
          label: 'Language',
          trailing: _language,
          colorScheme: colorScheme,
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _SectionHeader(title: 'Notifications', colorScheme: colorScheme),
        _ToggleTile(
          icon: Icons.notifications_outlined,
          label: 'Push Notifications',
          value: _notifications,
          colorScheme: colorScheme,
          onChanged: (v) => setState(() => _notifications = v),
        ),
        _NavigationTile(
          icon: Icons.volume_up_outlined,
          label: 'Sound & Vibration',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _SectionHeader(title: 'Privacy', colorScheme: colorScheme),
        _ToggleTile(
          icon: Icons.location_on_outlined,
          label: 'Location Services',
          value: _locationServices,
          colorScheme: colorScheme,
          onChanged: (v) => setState(() => _locationServices = v),
        ),
        _NavigationTile(
          icon: Icons.lock_outline,
          label: 'Privacy Settings',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _SectionHeader(title: 'Data', colorScheme: colorScheme),
        _ToggleTile(
          icon: Icons.sync,
          label: 'Background Sync',
          value: _dataSync,
          colorScheme: colorScheme,
          onChanged: (v) => setState(() => _dataSync = v),
        ),
        _NavigationTile(
          icon: Icons.storage_outlined,
          label: 'Storage & Cache',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _SectionHeader(title: 'About', colorScheme: colorScheme),
        _NavigationTile(
          icon: Icons.info_outline,
          label: 'Version',
          trailing: '1.0.0',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        _NavigationTile(
          icon: Icons.description_outlined,
          label: 'Terms of Service',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        _NavigationTile(
          icon: Icons.privacy_tip_outlined,
          label: 'Privacy Policy',
          colorScheme: colorScheme,
          onTap: () {},
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final ColorScheme colorScheme;

  const _SectionHeader({required this.title, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ColorScheme colorScheme;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        secondary: Icon(icon, color: colorScheme.primary),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        value: value,
        onChanged: onChanged,
        activeColor: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final ColorScheme colorScheme;
  final VoidCallback onTap;

  const _NavigationTile({
    required this.icon,
    required this.label,
    this.trailing,
    required this.colorScheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: trailing != null
            ? Text(trailing!, style: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)))
            : const Icon(Icons.chevron_right),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
