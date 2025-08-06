import 'package:custom_quick_alert_example/advanced_examples.dart';
import 'package:custom_quick_alert_example/basic_examples.dart';
import 'package:custom_quick_alert_example/real_world_examples.dart';
import 'package:flutter/material.dart';

/// Main navigation page for all examples
class ExampleNavigationPage extends StatelessWidget {
  const ExampleNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Quick Alert Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),

            // Header
            const Text(
              '🚀 Custom Quick Alert',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            const Text(
              'Professional Flutter Alert Dialogs',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Example Categories
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildCategoryCard(
                    context,
                    title: 'Basic Examples',
                    description:
                        'Learn the fundamentals with simple alert types',
                    icon: Icons.school,
                    color: Colors.green,
                    destination: const BasicExamplesPage(),
                    features: <String>[
                      'Success, Error, Warning alerts',
                      'Info and Confirmation dialogs',
                      'Loading and Custom alerts',
                      'Simple one-line implementations',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCategoryCard(
                    context,
                    title: 'Advanced Examples',
                    description: 'Explore animations, positioning, and styling',
                    icon: Icons.settings,
                    color: Colors.purple,
                    destination: const AdvancedExamplesPage(),
                    features: <String>[
                      'Animation types and effects',
                      'Screen positioning options',
                      'Professional styling themes',
                      'Interactive features',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCategoryCard(
                    context,
                    title: 'Real-World Examples',
                    description:
                        'Practical implementations for common scenarios',
                    icon: Icons.business,
                    color: Colors.teal,
                    destination: const RealWorldExamplesPage(),
                    features: <String>[
                      'Authentication flows',
                      'File operations',
                      'Network handling',
                      'E-commerce scenarios',
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    '💡 Pro Tip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Initialize CustomQuickAlert.initialize(navigatorKey) in your main() function for context-free usage throughout your app.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Widget destination,
    required List<String> features,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => destination,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: color.withValues(alpha: 0.1),
                    radius: 24,
                    child: Icon(icon, color: color, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                    size: 16,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Features list
              ...features.map(
                (String feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.check_circle,
                        color: color,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
