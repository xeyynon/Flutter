import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/widgets/drawer.dart';
import 'package:flutter_catalog/pages/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "XeYN";

    // ✅ Ensure CatalogModel.items is initialized
    final List dummyList;
    if ((CatalogModel.items.isNotEmpty)) {
      dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    } else {
      dummyList = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dummyList.isNotEmpty
            ? ListView.builder(
                itemCount: dummyList.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: dummyList[index],
                  );
                },
              )
            : const Center(child: Text("No items available")),
      ),
      drawer: const MyDrawer(),
    );
  }
}
