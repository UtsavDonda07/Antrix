import 'package:flutter/material.dart';
import 'package:project/components/reusableCard.dart';
import '../components/reusableCircle.dart';
import 'json_fatch_data.dart';
class MyFunction{

 static showBrandList() {
    return FutureBuilder<List<Brands>>(
      future: DataFromAPI.getBrandData(),
      builder: (context, snapshot) {
        final brands = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Text("Loading ..."),
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text("error occure"));
            } else {
              return buildBrands(brands!);
            }
        }
      },
    );
 }
   static Widget buildBrands(List<Brands> brands) => ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: brands.length,
      itemBuilder: (context, index) {
        final brand = brands[index];
        return ReusableCircle(brand.name,brand.slug);
      },
    );

 static showPhones(Future<List<Phones>> fun) {
   return FutureBuilder<List<Phones>>(
     future: fun,
     builder: (context, snapshot) {
       final phones = snapshot.data;
       switch (snapshot.connectionState) {
         case ConnectionState.waiting:
           return Center(
             child: Text("Loading ..."),
           );
         default:
           if (snapshot.hasError) {
             return Center(child: Text("error occure"));
           } else {
             return buildPhones(phones!);
           }
       }
     },
   );
 }
 static Widget buildPhones(List<Phones> phones) => ListView.builder(
   scrollDirection: Axis.horizontal,
   itemCount: phones.length,
   itemBuilder: (context, index) {
     final phone = phones[index];
     return ReusableCard(name: phone.name,url: phone.image,slug:phone.slug,detail:phone.detail);
   },
 );





}