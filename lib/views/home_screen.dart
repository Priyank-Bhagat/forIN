import 'package:flutter/material.dart';
import 'package:flutter_pro_1/logic/services_cred.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        var proObject = ref.watch(stringProvider);
        return Column(
          children: [
            TextField(
              controller: value,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        ref
                            .watch(stringProvider.notifier)
                            .addString(value.text);
                      },
                      child: const Icon(Icons.add))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: proObject.lString.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          ref
                              .watch(stringProvider.notifier)
                              .removeString(index);
                        },
                        child: Center(child: Text(proObject.lString[index])));
                  }),
            )
          ],
        );
      }),
    );
  }
}
