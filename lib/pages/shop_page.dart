import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sneakertutorial/components/shoe_tile.dart';
import 'package:sneakertutorial/models/cart.dart';
import 'package:sneakertutorial/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Shoe Added to Cart"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search bar
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Find A Shoe',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        )
                      ],
                    )),
                // message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'take back your soles',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                //hot picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grails ♚',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        'All Releases',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Shoe shoe = value.getItemsForSale()[index];
                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                            //   // Navigate to detail page
                            // },
                          );
                        })),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
