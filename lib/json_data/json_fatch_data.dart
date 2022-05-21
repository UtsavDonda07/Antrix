import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataFromAPI {
  //Method to get the list of brands.
  static Future<List<Brands>> getBrandData() async {
    List<Brands> brands = [];
    var jsonData = await fetch_data.call_api(
        "https://api-mobilespecs.azharimm.site/v2/brands"); //Get data in JSON format from the api
    var data = jsonData['data'];
    // print(data);

    for (var u in data) {
      Brands brand = Brands(u['brand_id'], u['brand_name'], u['brand_slug']);
      brands.add(brand); //Storing all Brand {user-defined structure} objects
    }
    print(brands.length);
    return brands; //Returning brands list
  }

  static getDetails(String details) async {
    var jsonData = await fetch_data.call_api(details);
    var data = jsonData['data']['thumbnail'];
    return data;
  }

  //It doesn't provide image, instead gives hits stored in assets variable.
  static Future<List<Phones>> getTopByInterest() async {
    List<Phones> phones = [];
    var jsonData = await fetch_data.call_api(
        "https://api-mobilespecs.azharimm.site/v2/top-by-interest"); //Get data in JSON format from the api
    var data = jsonData['data']['phones'];
    // print(data);
    for (var u in data) {
      String image = await getDetails(u['detail']);

      // String storage = await getDetails(u['detail']);
      Phones phone = Phones(u['phone_name'], u['slug'], image, u['detail']);
      phones.add(phone); //Storing all Phones {user-defined structure} objects
    }
    return phones; //Returning phones list
  }

  static Future<List<Phones>> getLatestPhone() async {
    List<Phones> phones = [];
    var jsonData = await fetch_data.call_api(
        "https://api-mobilespecs.azharimm.site/v2/latest"); //Get data in JSON format from the api
    var data = jsonData['data']['phones'];
    for (var u in data) {
      Phones phone =
          Phones(u['phone_name'], u['slug'], u['image'], u['detail']);
      phones.add(phone); //Storing all Phones {user-defined structure} objects
    }
    // print(phones.length);
    return phones; //Returning phones list
  }

  //It doesn't provide image, instead gives hits stored in assets variable.
  static Future<List<Phones>> getTopByFans() async {
    List<Phones> phones = [];
    var jsonData = await fetch_data.call_api(
        "https://api-mobilespecs.azharimm.site/v2/top-by-fans"); //Get data in JSON format from the api
    var data = jsonData['data']['phones'];
    // print(data);
    for (var u in data) {
      String image = await getDetails(u['detail']);
      Phones phone = Phones(u['phone_name'], u['slug'], image, u['detail']);
      phones.add(phone); //Storing all Phones {user-defined structure} objects
      print(phones[u].name);
    }
    return phones; //Returning phones list
  }

  static Future<List<String>> getPhoneSpecification(phone) async {
    List<String> phones = [];
    var jsonData = await fetch_data
        .call_api("https://api-mobilespecs.azharimm.site/v2/" + phone);
    var data = jsonData['data'];
    phones.add(jsonData['data']['brand']); //0
    phones.add(jsonData['data']['phone_name']); //1
    phones.add(jsonData['data']['phone_images'][0]); //2
    phones.add(jsonData['data']['phone_images'][0]); //3
    phones.add(jsonData['data']['release_date']); //4
    phones.add(jsonData['data']['dimension']); //5
    phones.add(jsonData['data']['os']); //6
    phones.add(jsonData['data']['storage']); //7
    phones.add(
        jsonData['data']['specifications'][6]['specs'][0]['val'][0]); //8 camera
    phones.add(jsonData['data']['specifications'][7]['specs'][0]['val']
        [0]); //9 front camera
    phones.add(jsonData['data']['specifications'][11]['specs'][0]['val']
        [0]); //10 battery
    phones.add(jsonData['data']['specifications'][4]['specs'][1]['val']
        [0]); //11 processor
    phones.add(jsonData['data']['specifications'][3]['specs'][0]['val']
        [0]); //12  display
    phones.add(jsonData['data']['specifications'][12]['specs'][0]['val']
        [0]); //13 color
    phones.add(jsonData['data']['specifications'][0]['specs'][0]['val']
        [0]); //14 Celular Technology
    phones.add(jsonData['data']['specifications'][10]['specs'][0]['val']
        [0]); //15 sensors

    phones.add(jsonData['data']['specifications'][8]['specs'][0]['val']
        [0]); //16 speaker
    phones.add(jsonData['data']['specifications'][8]['specs'][1]['val']
        [0]); //17 3.5mm jack

    phones.add(jsonData['data']['specifications'][9]['specs'][1]['val']
        [0]); //18 Bluetooth
    phones.add(
        jsonData['data']['specifications'][9]['specs'][2]['val'][0]); //19 gps
    phones.add(
        jsonData['data']['specifications'][9]['specs'][3]['val'][0]); //20 NFC
    phones.add(
        jsonData['data']['specifications'][9]['specs'][4]['val'][0]); //21 radio
    phones.add(
        jsonData['data']['specifications'][9]['specs'][5]['val'][0]); //22 usb
    // phones.add(jsonData['data']['specifications'][11]['specs'][1]['val'][0]);  //23 charging

    phones.add("Not Available"); //24 price error given
    // phones.add(jsonData['data']['specifications'][12]['specs'][2]['val'][0]);

    return phones;
  }

  //Method to get the list of phones of a specific brand.
  static Future<List<Phones>> getPhonesData(brand) async {
    List<Phones> phones = [];
    var jsonData = await fetch_data.call_api(
        "http://api-mobilespecs.azharimm.site/v2/brands/" +
            brand); //Get page 1 data in JSON format from the api
    var data = jsonData['data']['phones'];

    for (var u in data) {
      Phones phone =
          Phones(u['phone_name'], u['slug'], u['image'], u['detail']);
      phones.add(phone); //Storing all Phones {user-defined structure} objects
    }

    int total_pages =
        jsonData['data']['last_page']; //Number of pages to be called
    int current_page =
        jsonData['data']['current_page']; //Iterator for pages in the data

    //Get the remaining pages' data using same steps
    if (total_pages != current_page) {
      while (current_page != total_pages) {
        current_page = current_page + 1;
        var jsonData = await fetch_data.call_api(
            "http://api-mobilespecs.azharimm.site/v2/brands/" +
                brand +
                "?page=" +
                current_page.toString());
        var data = jsonData['data']['phones'];
        for (var u in data) {
          Phones phone =
              Phones(u['phone_name'], u['slug'], u['image'], u['detail']);
          phones.add(phone);
        }
      }
    }

    print(phones);
    return phones; //Returning phones list
  }

  // Search by brand or phone, might not return much
  static Future<List<Phones>> search(name) async {
    List<Phones> phones = [];
    var jsonData = await fetch_data.call_api(
        "https://api-mobilespecs.azharimm.site/v2/search?query= " +
            name); //Get data in JSON format from the api
    var data = jsonData['data']['phones'];
    for (var u in data) {
      Phones phone =
          Phones(u['phone_name'], u['slug'], u['image'], u['detail']);
      phones.add(phone); //Storing all Phones {user-defined structure} objects
    }
    return phones;
  }
}

//Brands class for defining required parameters.
class Brands {
  final int id;
  final String name, slug;

  Brands(this.id, this.name, this.slug); //Constructor
}

//Phones class for defining required parameters.
class Phones {
  final String name, slug, image, detail;

  Phones(this.name, this.slug, this.image, this.detail); //Constructor

  static Phones fromJson(json) => Phones(
        json['phone_name'],
        json['slug'],
        json['images'],
        json['detail'],
      );
}

class Details {
  final String name, brand, storage, os;
  Details({
    required this.name,
    required this.brand,
    required this.storage,
    required this.os,
  });

  static Details fromJson(json) => Details(
        name: json['phone_name'],
        brand: json['brand'],
        storage: json['storage'],
        os: json['os'],
      );
}

//Call the API, get JSON Data
class fetch_data {
  static call_api(url) async {
    var response = await http.get(Uri.parse(url)); //Calling the api
    var jsonData =
        jsonDecode(response.body); //Parsing the response into JSON format
    return jsonData;
  }
}
