import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchalbe_spinner {
  static searchalbe_spinner _instance;
  factory searchalbe_spinner() => _instance ??= new searchalbe_spinner._();

  searchalbe_spinner._();
  static Future<int> createSearchalbeDialog(BuildContext context, String title, List<String> liste){

    TextEditingController searchController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.grey,
                        primaryColorDark: Colors.grey,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: "Search",
                            prefixIcon: Icon(Icons.search,color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: liste.length,
                        itemBuilder: (context, index) {
                          if (searchController.text.isEmpty) {
                            return Container(
                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                                      child: Text(liste[index]),
                                    )
                                )
                            );
                          }
                          else if (liste[index]
                              .toLowerCase()
                              .contains(searchController.text) ||
                              liste[index]
                                  .toLowerCase()
                                  .contains(searchController.text)) {
                            return Container(
                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                                      child: Text(liste[index]),
                                    )
                                )
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pop(0);
              },
            ),
          ],
        );
      });
    });

  }

}
