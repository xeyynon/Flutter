import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/widgets/drawer.dart';
import 'package:flutter_catalog/pages/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["Products"];
  }

  @override
  Widget build(BuildContext context) {
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
