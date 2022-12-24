import 'package:flutter/material.dart';

import '../../core/storage/storage.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    final storage = Storage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StoragePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${storage.name}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                storage.name = 'Ricardo Emerson';

                setState(() {});
              },
              child: const Text('Gravar Nome'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.name = '';

                setState(() {});
              },
              child: const Text('Remover Nome'),
            ),
            const Divider(),
            Text(
              'Name GetX: ${storage.nameGetX}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                storage.nameGetX = 'Ricardo GetX';

                setState(() {});
              },
              child: const Text('Gravar Nome GetX'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.nameGetX = '';

                setState(() {});
              },
              child: const Text('Remover Nome GetX'),
            ),
          ],
        ),
      ),
    );
  }
}
