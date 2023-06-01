import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/vendor/views/screens/upload_tap_screens/shipping_screen.dart';
import 'package:provider/provider.dart';

import 'upload_tap_screens/attributes_tab_screen.dart';
import 'upload_tap_screens/general_screen.dart';
import 'upload_tap_screens/images_tab_screen.dart';

class UploadScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow.shade900,
            bottom: TabBar(tabs: [
              Tab(
                child: Text('Geral'),
              ),
              Tab(
                child: Text('Shipping'),
              ),
              Tab(
                child: Text('Sobre'),
              ),
              Tab(
                child: Text('Imagens'),
              ),
            ]),
          ),
          body: TabBarView(children: [
            GeneralScreen(),
            ShippingScreen(),
            AttributesTabScreen(),
            ImagesTabScreen(),
          ]),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow.shade900),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  print(_productProvider.productData['productName']);
                  print(_productProvider.productData['productPrice']);
                  print(_productProvider.productData['quantity']);
                  print(_productProvider.productData['category']);
                  print(_productProvider.productData['description']);
                  print(_productProvider.productData['imageUrlList']);
                  print(_productProvider.productData['chargeShipping']);
                  print(_productProvider.productData['shippingCharge']);
                }
              },
              child: Text('Salvar'),
            ),
          ),
        ),
      ),
    );
  }
}
