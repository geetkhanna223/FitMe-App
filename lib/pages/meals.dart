import 'package:fit_me/models/mealModel.dart';
import 'package:flutter/material.dart';

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  List<Meal> meals= [
    Meal(mealLabel:"High in Protein",url: "https://content.health.harvard.edu/wp-content/uploads/2024/01/28e8e464-f55e-4b32-9bab-dc990d8cc927.jpg"),
    Meal(mealLabel:"High in Calories",url: "https://hashtagmagazine.in/wp-content/uploads/2023/02/Nutritious-High-Calorie-Foods-For-a-Healthy-Weight-Gain-Hashtag-Magazine.png"),
    Meal(mealLabel:"High in Vitamins",url: "https://images.immediate.co.uk/production/volatile/sites/30/2023/03/Vitamind-foods-30d54cf.jpg?quality=90&webp=true&resize=375,341"),
    Meal(mealLabel:"High in Minerals",url: "https://static.toiimg.com/thumb/69598494.cms?width=680&height=512&imgsize=318513"),
    Meal(mealLabel:"High in Calcium",url: "https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2020/12/23182247/shutterstock_371429881-1-810x629.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        backgroundColor: Colors.pinkAccent,
        titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
        elevation: 4,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.builder(
          itemBuilder: (context, index){
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ListTile(
                    onTap: () {

                  },
                  title: Text(
                    '${meals[index].mealLabel}',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20
                    ),
                  ),
                    decoration: BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage('${meals[index].url}'),
                    fit: BoxFit.cover
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: meals.length,
        ),
      )
    );
  }
}