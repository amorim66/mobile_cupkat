import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final List<String> _categorylable = [
    'food',
    'vegetable',
    'egg',
    'tea',
    'test',
    'test',
    'test',
    'test',
    'test',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categoria',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categorylable.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ActionChip(
                            backgroundColor: Color.fromRGBO(64, 0, 66, 1),
                            onPressed: () {},
                            label: Center(
                              child: Text(
                                _categorylable[index],
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            )),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
