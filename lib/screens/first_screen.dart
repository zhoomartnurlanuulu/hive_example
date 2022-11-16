import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tutorial_app/feature/data/hive/gadget_model.dart';
import 'package:hive_tutorial_app/feature/data/hive/hive_name.dart';

import 'package:hive_tutorial_app/widgets/alert_dialog.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green, Colors.yellow.shade800]),
      appBar: AppBar(
        title: const Text('Hive App'),
        elevation: 2.5,
        backgroundColor: Colors.amber,
        primary: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.blue,
        onPressed: () {
          showDialog(
              context: context, builder: (BuildContext context) => AppDialog());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<GadgetModel>(HiveBoxes.gadgetModel).listenable(),
          builder: (context, Box<GadgetModel> box, __) {
            if (box.isEmpty) {
              return const Center(
                child: Text('Ничего нет'),
              );
            }
            return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: box.values.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemBuilder: (context, index) {
                  final GadgetModel? res = box.getAt(index);
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Удалить  ',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        res!.delete();
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  res?.brand == null ? '' : res!.brand,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Модель:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(res?.model == null ? '' : res!.model,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Категория:',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 15),
                                ),
                                Text(
                                  res?.type == null ? '' : res!.type,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Цена:',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 15),
                                ),
                                Text(
                                  res?.price == null ? '' : '${res!.price}\$',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[700]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                });
          }),
    );
  }
}
