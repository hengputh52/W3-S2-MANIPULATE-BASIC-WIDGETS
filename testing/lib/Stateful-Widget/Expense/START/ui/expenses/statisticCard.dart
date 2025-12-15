import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget
{
  const StatisticCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Row(
        children: [
          Column(
            children: [
              Icon(Icons.food_bank),
              Text('Food')
            ],
          ),
          Column(
            children: [
              Icon(Icons.travel_explore),
              Text('Traveler')
            ],
          ),
          Column(
            children: [
              Icon(Icons.work),
              Text('work')
            ],
          ),
          Column(
            children: [
              Icon(Icons.sports),
              Text('Sport'),
            ],
          )
        ],
      ),
    );
  }
}