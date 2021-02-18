import 'package:flutter/material.dart';
import 'package:task_app/domain/data_from_json.dart';

import '../../domain/model.dart';
import 'widgets/custom_list_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> items;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    DataFromJson.fetchData().then((item) {
      setState(() {
        items = item;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.blue[700],
        ),
        shadowColor: Colors.transparent,
        title: Text(
          'task.',
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'Tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CustomListTile(
                      title: items[index].title,
                      createdAt: items[index].createdAt,
                      id: items[index].id,
                    );
                  }, childCount: items.length),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
