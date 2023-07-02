import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  bool _areNotificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDark = prefs.getBool("isDark") ?? false;
      _areNotificationsEnabled =
          prefs.getBool("areNotificationsEnabled") ?? true;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", _isDark);
    await prefs.setBool("areNotificationsEnabled", _areNotificationsEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Dark Mode"),
                  leading: const Icon(Icons.dark_mode_outlined),
                  trailing: Switch(
                      value: _isDark,
                      onChanged: (value) {
                        setState(() {
                          _isDark = value;
                        });
                        _saveSettings();
                      }),
                ),
                ListTile(
                  title: const Text("Notifications"),
                  leading: const Icon(Icons.notifications_none_rounded),
                  trailing: Switch(
                      value: _areNotificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _areNotificationsEnabled = value;
                        });
                        _saveSettings();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
