import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business Consulting",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        "Business consulting services to clients to help them develop business strategies, improve operational efficiency, or pursue new opportunities in various business areas.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
         
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project management",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Project management services to other companies who want to launch large projects with efficiency and within the specified time.",
                      ),
                       SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Card(
          margin: EdgeInsets.all(8.0),
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer service",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Focus on high-quality customer service to help companies improve relationships with their customers and achieve better customer satisfaction.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
