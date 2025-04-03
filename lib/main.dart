import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '画像フォーマット表示サンプル',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ImageSamplePage(),
    );
  }
}

class ImageSamplePage extends StatelessWidget {
  const ImageSamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像フォーマット表示サンプル'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JPEGフォーマットの画像
            _buildImageSection(context, 'JPEG画像', 'assets/images/sample.jpg',
                'JPEGは写真やグラデーションのある画像に適した形式です。'),
            const Divider(height: 32),

            // PNGフォーマットの画像
            _buildImageSection(context, 'PNG画像', 'assets/images/sample.png',
                'PNGは透過をサポートし、線画やアイコンに適した形式です。'),
            const Divider(height: 32),

            // WebPフォーマットの画像
            _buildImageSection(context, 'WebP画像', 'assets/images/sample.webp',
                'WebPはJPEGより高い圧縮率と透過をサポートする形式です。'),
            const Divider(height: 32),

            // GIFフォーマットの画像（アニメーション）
            _buildImageSection(context, 'GIF画像', 'assets/images/sample.gif',
                'GIFはアニメーションをサポートする形式です。'),
            const SizedBox(height: 16),

            // 様々な表示方法の例
            _buildFitExamples(context),
          ],
        ),
      ),
    );
  }

  // 画像セクションを構築するヘルパーメソッド
  Widget _buildImageSection(
    BuildContext context,
    String title,
    String assetPath,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              assetPath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'アセットパス: $assetPath',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  // 異なるBoxFitの例を構築するヘルパーメソッド
  Widget _buildFitExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BoxFitの様々な表示方法',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildBoxFitExample('cover', BoxFit.cover),
            _buildBoxFitExample('contain', BoxFit.contain),
            _buildBoxFitExample('fill', BoxFit.fill),
            _buildBoxFitExample('fitWidth', BoxFit.fitWidth),
            _buildBoxFitExample('fitHeight', BoxFit.fitHeight),
            _buildBoxFitExample('none', BoxFit.none),
          ],
        ),
      ],
    );
  }

  // 個々のBoxFit例を構築するヘルパーメソッド
  Widget _buildBoxFitExample(String title, BoxFit fit) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                'assets/images/sample.png',
                fit: fit,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'BoxFit.$title',
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
