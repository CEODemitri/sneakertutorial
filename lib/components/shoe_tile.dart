import 'package:flutter/material.dart';
import 'package:sneakertutorial/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(shoe.imagePath),
          Text(shoe.description, style: TextStyle(color: Colors.grey[600]),),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.name, style: const TextStyle(fontWeight: FontWeight
                      .bold, fontSize: 24),),
                  Text('\$' + shoe.price, style: TextStyle(color: Colors
                      .grey),),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.black, 
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      )),
                  child: Icon(Icons.add, color: Colors.white,))
            ],),
          )
        ],
      ),
    );
  }
}
