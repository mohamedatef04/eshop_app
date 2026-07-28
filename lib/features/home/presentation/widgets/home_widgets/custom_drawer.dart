import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    
    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://via.placeholder.com/60x60'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jane Doe', // Mock user name
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'jane.doe@example.com',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            
            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.home_outlined,
                    title: s.home,
                    onTap: () {},
                    theme: theme,
                  ),
                  _buildDrawerItem(
                    icon: Icons.person_outline,
                    title: s.profile,
                    onTap: () {},
                    theme: theme,
                  ),
                  _buildDrawerItem(
                    icon: Icons.shopping_cart_outlined,
                    title: s.cart,
                    onTap: () {},
                    theme: theme,
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings_outlined,
                    title: s.settings,
                    onTap: () {},
                    theme: theme,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Divider(),
                  ),
                  // Theme Toggle
                  ExpansionTile(
                    leading: Icon(Icons.palette_outlined, color: theme.colorScheme.onSurface),
                    title: Text(
                      s.appearance,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 72, right: 16),
                        title: Text(s.light_mode),
                        trailing: Icon(Icons.light_mode, color: theme.colorScheme.secondary, size: 20),
                        onTap: () {
                          // Change theme logic here
                        },
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 72, right: 16),
                        title: Text(s.dark_mode),
                        trailing: Icon(Icons.dark_mode, color: theme.colorScheme.secondary, size: 20),
                        onTap: () {
                          // Change theme logic here
                        },
                      ),
                    ],
                  ),
                  // Language Toggle
                  ExpansionTile(
                    leading: Icon(Icons.language_outlined, color: theme.colorScheme.onSurface),
                    title: Text(
                      s.language,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 72, right: 16),
                        title: Text(s.english),
                        onTap: () {
                          // Change language logic here
                        },
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 72, right: 16),
                        title: Text(s.arabic),
                        onTap: () {
                          // Change language logic here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const Divider(),
            // Logout
            _buildDrawerItem(
              icon: Icons.logout,
              title: s.logout,
              onTap: () {},
              theme: theme,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required ThemeData theme,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? theme.colorScheme.onSurface),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: color ?? theme.colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
    );
  }
}
