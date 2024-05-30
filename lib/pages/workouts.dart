import 'package:fit_me/models/workoutModel.dart';
import 'package:flutter/material.dart';

class WorkOut extends StatefulWidget {
  const WorkOut({super.key});

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {

  List<WorkoutModel> workouts= [
    WorkoutModel(workoutName: 'Push Ups', url: "https://www.proathlix.com/blog/wp-content/uploads/2023/09/young-powerful-sportsman-training-push-ups-dark-wall.jpg.webp"),
    WorkoutModel(workoutName: 'Running', url: "https://trifocusfitnessacademy.co.za/wp-content/uploads/2018/07/running-results.v3jpg.jpg"),
    WorkoutModel(workoutName: 'Squats', url: "https://barbend.com/wp-content/uploads/2023/08/squat-workout-barbend.com_.jpg"),
    WorkoutModel(workoutName: 'Lunge', url: "https://hips.hearstapps.com/hmg-prod/images/jumping-lunges-1655394656.jpg?resize=980:*"),
    WorkoutModel(workoutName: 'Plank', url: "https://hips.hearstapps.com/hmg-prod/images/hdm119918mh3970-1545237057.png?crop=1xw:1xh;center,top&resize=980:*"),
    WorkoutModel(workoutName: 'Lateral raise', url: "https://images.ctfassets.net/8urtyqugdt2l/1EG31PaEzRIWNnuW9VeXcI/29ca964acdaf4d51494ca515971093f9/tile-image-how-to-do-lateral-raises.jpg"),
    WorkoutModel(workoutName: 'Crunches', url: "https://hips.hearstapps.com/hmg-prod/images/sit-up-1672248718.jpeg?crop=0.514xw:0.693xh;0.335xw,0.303xh&resize=1200:*"),
    WorkoutModel(workoutName: 'Glute Bridge', url: "https://hips.hearstapps.com/hmg-prod/images/fitness-man-doing-bodyweight-glute-single-leg-floor-royalty-free-image-1605025117.?crop=1.00xw:1.00xh;0,0&resize=2048:*"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        backgroundColor: Colors.pinkAccent,
        titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
        elevation: 4,

      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/exercise');
              },
              title: Text(
                '${workouts[index].workoutName}',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('${workouts[index].url}'),
                radius: 27,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20
              ),
            ),
          );
        },
        itemCount: workouts.length,
      ),
      backgroundColor: Colors.pinkAccent,
    );
  }
}
