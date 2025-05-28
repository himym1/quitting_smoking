import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';

class SmokingDataPage extends ConsumerStatefulWidget {
  const SmokingDataPage({super.key});

  @override
  ConsumerState<SmokingDataPage> createState() => _SmokingDataPageState();
}

class _SmokingDataPageState extends ConsumerState<SmokingDataPage> {
  final _formKey = GlobalKey<FormState>();
  final _dailyCigarettesController = TextEditingController();
  final _packPriceController = TextEditingController();
  final _cigarettesPerPackController = TextEditingController(
    text: "20",
  ); // 默认每包20支

  @override
  void initState() {
    super.initState();
    // 加载用户当前的数据
    _loadUserData();
  }

  void _loadUserData() {
    final authState = ref.read(authNotifierProvider);
    authState.maybeWhen(
      authenticated: (userProfile) {
        _dailyCigarettesController.text =
            userProfile.dailyCigarettes.toString();
        _packPriceController.text = userProfile.packPrice.toString();
      },
      orElse: () {},
    );
  }

  @override
  void dispose() {
    _dailyCigarettesController.dispose();
    _packPriceController.dispose();
    _cigarettesPerPackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.smokingDataSettingTitle)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // 说明文字
            Text(
              '请更新您的吸烟数据，这将帮助我们更准确地计算您的进度和节省。',
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            // 每日香烟数量
            TextFormField(
              controller: _dailyCigarettesController,
              decoration: InputDecoration(
                labelText: '每日吸烟量 (支)',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.smoking_rooms),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入每日吸烟量';
                }
                final number = int.tryParse(value);
                if (number == null || number <= 0) {
                  return '请输入大于0的数字';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // 香烟价格
            TextFormField(
              controller: _packPriceController,
              decoration: InputDecoration(
                labelText: '每包香烟价格 (元)',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.attach_money),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入香烟价格';
                }
                final price = double.tryParse(value);
                if (price == null || price <= 0) {
                  return '请输入大于0的数字';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // 每包香烟数量
            TextFormField(
              controller: _cigarettesPerPackController,
              decoration: InputDecoration(
                labelText: '每包香烟数量 (支)',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.inventory_2),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入每包香烟数量';
                }
                final number = int.tryParse(value);
                if (number == null || number <= 0) {
                  return '请输入大于0的数字';
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            // 保存按钮
            ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('保存更改'),
            ),

            const SizedBox(height: 16),

            // 取消按钮
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('取消'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      // 获取输入值
      final dailyCigarettes = int.parse(_dailyCigarettesController.text);
      final packPrice = double.parse(_packPriceController.text);
      final cigarettesPerPack = int.parse(_cigarettesPerPackController.text);

      // 将数据保存到用户档案
      final authNotifier = ref.read(authNotifierProvider.notifier);
      authNotifier.updateSmokingData(
        dailyCigarettes: dailyCigarettes,
        packPrice: packPrice,
        cigarettesPerPack: cigarettesPerPack,
      );

      // 显示保存成功消息
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('吸烟数据已更新')));

      // 返回上一页
      Navigator.of(context).pop();
    }
  }
}
