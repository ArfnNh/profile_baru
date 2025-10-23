import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kombinasi Widget Row & Column',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kombinasi: Icon, Button, Image, Text'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _showSnack(context, 'Mencari... (ngaco)'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CARD PROFIL: Row (image + column text + icon/button)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Avatar / Image
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/200',
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Column with texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gus Dev',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Flutter enthusiast • Aslab wannabe',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),

                          // Row inside Column: icons + small buttons
                          Row(
                            children: [
                              Icon(Icons.star, size: 18, color: Colors.amber),
                              const SizedBox(width: 6),
                              Text(
                                '4.9 (200+)',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              // Small text button
                              TextButton.icon(
                                onPressed: () =>
                                    _showSnack(context, 'Followed!'),
                                icon: Icon(Icons.person_add_alt_1),
                                label: Text('Follow'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Column with action icons
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () => _showSnack(context, 'Kirim pesan'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _showSnack(context, 'Pesan diklik'),
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Order'),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // SECTION: Image gallery with row
            Text('Gallery', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/1/400/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/2/400/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/3/400/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // SECTION: Card dengan kolom teks dan row tombol aksi
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi singkat',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ini contoh kombinasi widget yang memakai Row dan Column. Cocok buat profil, kartu produk, atau komponen UI modular lainnya.',
                      style: TextStyle(color: Colors.grey[800]),
                    ),

                    const SizedBox(height: 12),

                    // Row tombol aksi
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _showSnack(context, 'Buy clicked'),
                            icon: Icon(Icons.payments),
                            label: Text('Beli Sekarang'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () => _showSnack(context, 'Details'),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(width: 6),
                              Text('Detail'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // FOOTER: Row with icons and small labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _IconLabel(icon: Icons.thumb_up, label: 'Like'),
                _IconLabel(icon: Icons.comment, label: 'Comment'),
                _IconLabel(icon: Icons.share, label: 'Share'),
                _IconLabel(icon: Icons.bookmark, label: 'Save'),
              ],
            ),

            const SizedBox(height: 24),
            Center(
              child: Text(
                'Contoh sederhana — tinggal costumize sesuai kebutuhan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('$label clicked'))),
        ),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
