import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends ConsumerStatefulWidget {
  const HelpSupportPage({super.key});

  @override
  ConsumerState<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends ConsumerState<HelpSupportPage> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: '如何修改我的戒烟开始日期?',
      answer: '您可以在设置 -> 健康数据设置 -> 戒烟日期中修改您的戒烟开始日期和时间。请注意，修改戒烟日期会重置您的戒烟进度。',
    ),
    FAQItem(
      question: '我如何查看我解锁的成就?',
      answer: '进入应用底部导航栏中的"成就"标签页，您可以看到所有已解锁和未解锁的成就。',
    ),
    FAQItem(question: '应用支持离线使用吗?', answer: '是的，焕新之旅完全支持离线使用，您的所有数据都存储在本地设备上。'),
    FAQItem(
      question: '我可以导出我的戒烟数据吗?',
      answer: '目前版本暂不支持数据导出功能，我们计划在未来的版本中添加这一功能。',
    ),
    FAQItem(
      question: '如何打开每日通知提醒?',
      answer: '前往设置 -> 通知设置，您可以在那里开启或关闭各种通知，并设置提醒时间。',
    ),
    FAQItem(
      question: '我遇到了应用问题，如何寻求帮助?',
      answer: '您可以在本页面底部找到"联系客服"按钮，或者发送邮件至support@example.com描述您遇到的问题。',
    ),
  ];

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      queryParameters: {'subject': '焕新之旅应用支持请求'},
    );

    if (!await launchUrl(emailUri)) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('无法打开邮件客户端')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.helpAndSupportSettingTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 标题部分
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '我们在这里为您提供支持',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '如有任何问题，请查阅以下常见问题解答，或直接联系我们的客服团队。',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          // 常见问题部分
          Text(
            '常见问题解答',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),

          const SizedBox(height: 16),

          // FAQ展示
          ..._faqItems.map((item) => _buildFAQItem(item, theme)),

          const SizedBox(height: 32),

          // 联系我们部分
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '需要更多帮助?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    '如果您的问题没有在上面列出，或者需要个人化的支持，请随时联系我们的客服团队。我们通常会在24小时内回复。',
                    style: theme.textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed: _launchEmail,
                    icon: const Icon(Icons.email),
                    label: const Text('联系客服'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      minimumSize: const Size(double.infinity, 0), // 让按钮宽度填满父容器
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 帮助中心在线链接按钮
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('帮助中心功能即将推出')));
            },
            icon: const Icon(Icons.help_outline),
            label: const Text('访问在线帮助中心'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              minimumSize: const Size(double.infinity, 0),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFAQItem(FAQItem item, ThemeData theme) {
    return ExpansionTile(
      title: Text(
        item.question,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      childrenPadding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(item.answer, style: theme.textTheme.bodyMedium)],
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
