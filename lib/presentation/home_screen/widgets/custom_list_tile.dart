import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

final List<Color> cardColors = <Color>[
  Colors.pink[100],
  Colors.blue[100],
  Colors.green[100],
  Colors.purple[100],
];

class CustomListTile extends StatelessWidget {
  final int id;
  final String title;
  final DateTime createdAt;

  const CustomListTile({
    @required this.title,
    @required this.createdAt,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      child: Row(
        children: [
          TileStick(index: id),
          Flexible(
            flex: 2,
            child: Card(
              elevation: 0,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(DateFormat('dd/MM/yyyy')
                            .add_jm()
                            .format(createdAt)),
                      ],
                    ),
                  ),
                  Radio(
                    onChanged: (bool value) {},
                    value: true,
                    groupValue: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TileStick extends StatelessWidget {
  final int index;

  const TileStick({this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 15,
      child: Card(
        color: cardColors[index - 1],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
