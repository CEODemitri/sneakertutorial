import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakertutorial/components/cart_item.dart';
import 'package:sneakertutorial/models/cart.dart';
import 'package:sneakertutorial/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.getCart().length,
                      itemBuilder: (context, index) {
                        Shoe individualShoe = value.getCart()[index];

                        return CartItem(shoe: individualShoe);
                      },
                    ),
                  )
                ],
              ),
            ));
  }
}
