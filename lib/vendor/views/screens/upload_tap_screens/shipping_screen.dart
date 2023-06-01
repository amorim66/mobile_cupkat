import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ShippingScreen extends StatefulWidget {
  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool? _chargeShipping = false;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        CheckboxListTile(
            title: Text(
              'Custo de envio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            value: _chargeShipping,
            onChanged: (value) {
              setState(() {
                _chargeShipping = value;
                _productProvider.getFormData(chargeShipping: _chargeShipping);
              });
            }),
        if (_chargeShipping == true)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                  if(value!.isEmpty){
                    return 'Digite o valor do frete';
                  } else{
                    return null;
                  }
                },
              onChanged: (value) {
                _productProvider.getFormData(shippingCharge: int.parse(value));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Shipping Charge',
              ),
            ),
          )
      ],
    );
  }
}
