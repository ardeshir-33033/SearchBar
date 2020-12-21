import 'package:flutter/material.dart';
import 'package:search_bar/Models/Sample.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      childAspectRatio: 0.6,
      crossAxisCount: 2,
      children: List.generate(sampleList.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      sampleList[index].imageUrl,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                  ),
                  Text(sampleList[index].title),
                  Text(sampleList[index].name),
                  Text(sampleList[index].subtitle),
                  Container(
                    child: Center(
                      child: Text(
                        sampleList[index].price.toString(),
                      ),
                    ),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
