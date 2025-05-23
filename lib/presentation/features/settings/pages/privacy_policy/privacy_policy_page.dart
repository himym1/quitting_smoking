import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

class PrivacyPolicyPage extends ConsumerWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final privacyPolicySections = [
      PrivacyPolicySection(
        title: '引言',
        content:
            '欢迎使用"焕新之旅"应用。我们重视您的隐私并致力于保护您的个人信息。本隐私政策旨在告知您我们如何收集、使用、存储和保护您的个人信息，以及您对这些信息所拥有的权利。请在使用我们的应用前仔细阅读此政策。',
      ),
      PrivacyPolicySection(
        title: '信息收集',
        content:
            '我们收集的信息包括：\n\n'
            '• 用户提供的信息：当您创建账户、设置个人资料或使用应用功能时，我们会收集您主动提供的信息，如姓名、电子邮件地址、吸烟习惯数据等。\n\n'
            '• 使用数据：我们自动收集有关您如何使用应用的信息，包括您的交互方式、功能使用频率和时长等。\n\n'
            '• 设备信息：我们可能收集您使用的设备类型、操作系统版本和唯一设备标识符等技术信息。',
      ),
      PrivacyPolicySection(
        title: '信息使用',
        content:
            '我们使用收集到的信息：\n\n'
            '• 提供、维护和改进应用功能和服务\n'
            '• 个性化您的体验，如提供定制的戒烟建议和成就激励\n'
            '• 与您沟通，包括发送服务通知、更新和营销信息（如您选择接收）\n'
            '• 进行分析和研究，以便改进我们的应用和服务\n'
            '• 检测、预防和解决技术问题和潜在的滥用行为',
      ),
      PrivacyPolicySection(
        title: '数据存储',
        content:
            '您的个人信息将主要存储在您的设备本地。对于选择创建账户的用户，部分数据可能会存储在我们的安全服务器上，以便在多设备间同步。我们采取适当的技术和组织措施来保护您的数据免受未经授权的访问、使用或泄露。',
      ),
      PrivacyPolicySection(
        title: '数据共享',
        content:
            '我们不会出售、出租或以其他方式向第三方披露您的个人信息，除非：\n\n'
            '• 经您明确同意\n'
            '• 为了履行法律义务\n'
            '• 保护"焕新之旅"或用户的权利和安全\n'
            '• 与为我们提供服务的供应商合作，这些供应商受到保密义务的约束',
      ),
      PrivacyPolicySection(
        title: '您的权利',
        content:
            '根据适用的数据保护法律，您有权：\n\n'
            '• 访问您的个人信息\n'
            '• 更正不准确的个人信息\n'
            '• 删除您的个人信息\n'
            '• 限制或反对处理您的个人信息\n'
            '• 获取您提供给我们的个人信息的便携版本\n'
            '• 撤回您之前给予的同意',
      ),
      PrivacyPolicySection(
        title: '儿童隐私',
        content:
            '"焕新之旅"应用不针对13岁以下儿童。我们不会故意收集13岁以下儿童的个人信息。如果我们发现意外收集了此类信息，我们将立即删除。',
      ),
      PrivacyPolicySection(
        title: '政策更新',
        content: '我们可能会不时更新本隐私政策。更新后的政策将在应用内公布，并在生效日期标明。我们鼓励用户定期查看本政策以了解任何变更。',
      ),
      PrivacyPolicySection(
        title: '联系我们',
        content:
            '如果您对本隐私政策有任何疑问、意见或请求，请通过以下方式联系我们：\n\n'
            'Email: privacy@example.com',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(localizations.privacyPolicySettingTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 标题
          Text(
            '隐私政策',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // 最后更新日期
          Text(
            '最后更新日期：2023年9月1日',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // 隐私政策各章节
          ...privacyPolicySections.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(section.content, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 24),
              ],
            );
          }).toList(),

          // 确认阅读按钮
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('感谢您阅读我们的隐私政策')));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('我已阅读并理解'),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class PrivacyPolicySection {
  final String title;
  final String content;

  PrivacyPolicySection({required this.title, required this.content});
}
