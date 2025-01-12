import 'dart:convert';
import 'package:airbnb_clone_app/features/home/data/models/booking_model/booking_model.dart';
import 'package:flutter/material.dart';

class BookingInfoWidget extends StatelessWidget {
  final BookingModel booking;

  const BookingInfoWidget({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = booking.property?.images != null
        ? List<String>.from(json.decode(booking.property!.images!))
        : [];

    print(imageUrls);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (booking.user != null)
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(booking.user?.profileImage ??
                        'https://avatar.iran.liara.run/public/boy?username=Ash'),
                    backgroundColor: Colors.grey[200],
                    child: booking.user?.profileImage == null
                        ? const Icon(Icons.person, size: 20, color: Colors.grey)
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    booking.user?.name ?? 'Unknown User',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            if (imageUrls.isNotEmpty)
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrls[index],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            else
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Text(
              booking.property?.name ?? 'No Property Name',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              booking.property?.description ?? 'No description available',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              'Price: ${booking.property?.price ?? 'Not available'}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Start Date: ${booking.startDate ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'End Date: ${booking.endDate ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
