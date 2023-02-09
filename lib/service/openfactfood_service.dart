import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/service/off_response_adapter.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';

class OpenfactfoodService{

  static String baseUrl = "https://world.openfoodfacts.org/api/v2/";
  static String searchUrl = "${baseUrl}search?code=";

  static Widget getProductByISBN(String code){

    return FutureBuilder<Response>(
        future: get(Uri.parse(searchUrl+code)),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null){
            return ListProductsWidget(
                OpenfactfoodAdapter.responseToList(snapshot.data!)
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }
      );

  }
  
}