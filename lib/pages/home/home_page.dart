import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String? name;
  late String? nameGetX;
  late final VoidCallback listen, listenKey;

  final storage = GetStorage();
  final storageGetX = GetStorage('Jornada GetX');

  @override
  void initState() {
    listen = storage.listen(() {
      debugPrint('O Storage foi alterado');
    });

    listenKey = storage.listenKey('nameKey', (value) {
      debugPrint('Chave nameKey alterada: $value');
    });

    super.initState();
  }

  @override
  void dispose() {
    listen();
    listenKey();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    name = storage.read('nameKey') ?? '';
    nameGetX = storageGetX.read('nameKey') ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                storage.write('nameKey', 'Ricardo Emerson');

                setState(() {});
              },
              child: const Text('Gravar Nome'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.remove('nameKey');

                setState(() {});
              },
              child: const Text('Remover Nome'),
            ),
            const Divider(),
            Text(
              'Name GetX: $nameGetX',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                storageGetX.write('nameKey', 'Ricardo GetX');

                setState(() {});
              },
              child: const Text('Gravar Nome GetX'),
            ),
            ElevatedButton(
              onPressed: () {
                storageGetX.remove('nameKey');

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
