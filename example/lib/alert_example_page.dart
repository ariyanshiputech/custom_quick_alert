import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';

class AlertExamplesPage extends StatefulWidget {
  const AlertExamplesPage({super.key});

  @override
  State<AlertExamplesPage> createState() => _AlertExamplesPageState();
}

class _AlertExamplesPageState extends State<AlertExamplesPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Status'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: CustomQuickAlert.pageAlert(
            type: CustomQuickAlertType.error,
            title: 'Payment Failed',
            message:
                'Unfortunately, your payment could not be processed. Please review the details and try again.',
            confirmText: 'Try Again',
            cancelText: 'Contact Support',
            width: MediaQuery.of(context).size.width,
            borderRadius: 12,
            customContent: Column(
              children: [
                const SizedBox(height: 24),
                _buildTransactionDetailsCard(textTheme),
                _buildFailureReasonsCard(textTheme),
              ],
            ),
            onConfirm: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Retrying payment...'),
                    backgroundColor: Colors.blueAccent),
              );
            },
            onCancel: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Redirecting to support...'),
                    backgroundColor: Colors.green),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionDetailsCard(TextTheme textTheme) {
    return Card(
      elevation: 0,
      color: Colors.red.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Summary',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow(
                Icons.receipt_long, 'Transaction ID:', 'TXN123456789'),
            const Divider(height: 24),
            _buildDetailRow(Icons.attach_money, 'Amount:', r'$49.99'),
            const Divider(height: 24),
            _buildDetailRow(Icons.calendar_today, 'Date:', 'October 26, 2023'),
            const Divider(height: 24),
            _buildDetailRow(
                Icons.credit_card, 'Payment Method:', 'Visa **** 1234'),
          ],
        ),
      ),
    );
  }

  Widget _buildFailureReasonsCard(TextTheme textTheme) {
    return Card(
      elevation: 0,
      color: Colors.grey.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        title: Text(
          'Common Reasons for Failure',
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        children: [
          Column(
            children: [
              _buildReasonItem('Insufficient funds in the account.'),
              _buildReasonItem('Incorrect card details entered.'),
              _buildReasonItem('Card has expired or is blocked.'),
              _buildReasonItem(
                    'Bank declined the transaction for security reasons.'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildReasonItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
