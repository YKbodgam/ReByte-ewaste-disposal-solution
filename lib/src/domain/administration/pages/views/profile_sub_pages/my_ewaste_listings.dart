import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebyte/src/domain/administration/controllers/profile_sub_controllers/my_ewaste_listings_controller.dart';

class MyEwasteListings extends StatelessWidget {
  final myEwasteListingsController = Get.put(MyEwasteListingsController());
  MyEwasteListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Listings")),
      body: Obx(() {
        if (myEwasteListingsController.listings.isEmpty) {
          return Center(child: Text("No Listings Available"));
        }

        return ListView.builder(
          itemCount: myEwasteListingsController.listings.length,
          itemBuilder: (context, index) {
            final item = myEwasteListingsController.listings[index];
            return GestureDetector(
              onTap: () {
                // Get.to(() => ProductDetailPage(item: item));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category: ${item.category}",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(
                            "${item.quantity} ${item.units}",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
