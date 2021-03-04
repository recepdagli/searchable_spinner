# Searchable Spinner For Flutter

A simple searchable spinner for flutter (android and ios compatible)
- copy searchable_spinner.dart file on your project
- add this ```import 'package:<your package name>/searchable_spinner.dart';```
- define your required variables like this (list type must be String)
```
//sample list
List<String> list = ["1","2","3","4","5"];
  
//sample variable
String selectedFromList;
```
- call future from your onclick event and set selected variable
```
onTap: (){
    searchalbe_spinner.createSearchalbeDialog(context, "Select Item...", list).then((index) => {
        setState(() {
            selectedFromList = list[index];
        })
    });
},
```
