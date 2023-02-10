import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/product.dart';

class CustomRouterConfiguration{

  static const String HOME = "home";
  static const String SINGLE_PRODUCT = "single_product";

  static getRoutes(){
    return {
      HOME : {
        "path" : "/",
        "builder" : (context, state) => const HomePage(),
      },
      SINGLE_PRODUCT : {
        "path": "/product/:id",
        "builder": (context, state) => ProductPage(int.parse(state.params["id"]!)),
      }
    };
  }

}