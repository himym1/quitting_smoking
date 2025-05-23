// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 需要 ProviderScope
import 'package:quitting_smoking/app_widget.dart'; // 导入 AppWidget

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // 需要用 ProviderScope 包裹 AppWidget，因为 main.dart 中是这样做的
    await tester.pumpWidget(const ProviderScope(child: AppWidget()));

    // 在这里可以添加一些基础的验证，例如检查某个初始 Widget 是否存在
    // 但对于这个任务，确保应用能启动就足够了。
    // 例如，可以检查 MaterialApp 是否存在
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
