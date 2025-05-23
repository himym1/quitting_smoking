// 用于将SVG转换为PNG的工具脚本
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

Future<void> main() async {
  // 确保Flutter引擎初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 输入SVG文件路径
  final String svgPath = 'assets/images/lock_icon.svg';
  // 输出PNG文件路径
  final String pngPath = 'assets/images/lock_icon.png';

  // 读取SVG文件
  final String svgString = await File(svgPath).readAsString();

  // 创建SVG图片
  final DrawableRoot svgRoot = await svg.fromSvgString(svgString, 'lock_icon');

  // 设置图片尺寸
  final double width = 48;
  final double height = 48;

  // 创建图片
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(recorder);

  // 绘制SVG
  svgRoot.scaleCanvasToViewBox(canvas, Size(width, height));
  svgRoot.draw(canvas, Rect.fromLTWH(0, 0, width, height));

  // 完成图片
  final ui.Picture picture = recorder.endRecording();
  final ui.Image image = await picture.toImage(width.toInt(), height.toInt());

  // 获取图片字节数据
  final ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  final Uint8List pngBytes = byteData!.buffer.asUint8List();

  // 保存PNG文件
  await File(pngPath).writeAsBytes(pngBytes);

  print('转换完成: $pngPath');
  exit(0);
}
