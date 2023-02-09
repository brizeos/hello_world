import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class OpenfactfoodService extends FutureBuilder<Response>{

  static String baseUrl = "https://world.openfoodfacts.org/api/v2/";
  static String searchUrl = "${baseUrl}search?code=";

  OpenfactfoodService({required super.builder});



  static getProductByISBN(String code){

  }
  
}