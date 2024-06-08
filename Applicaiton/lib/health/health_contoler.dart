// import 'package:health/health.dart';
//
// class HealthController {
//   static var now = DateTime.now();
//   static var  midnight = DateTime(now.year, now.month, now.day);
//
//   // create a HealthFactory for use in the app, choose if HealthConnect should be used or not
//
//   final health = HealthFactory(useHealthConnectIfAvailable: true);
//   var types = [
//     HealthDataType.STEPS,
//     HealthDataType.BLOOD_GLUCOSE,
//     HealthDataType.WEIGHT,
//     HealthDataType.HEIGHT,
//     HealthDataType.BLOOD_OXYGEN,
//     HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
//     HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
//     HealthDataType.HEART_RATE
//   ];
//   Future<void> getHealthData() async {
//
//     // define the types to get
//
//     // requesting access to the data types before reading them
//     bool requested = await health.requestAuthorization(types);
//
//     var now = DateTime.now();
//
//     // fetch health data from the last 24 hours
//     List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
//         now.subtract(const Duration(days: 1)), now, types);
//
//     // request permissions to write steps and blood glucose
//     types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
//     var permissions = [
//       HealthDataAccess.READ_WRITE,
//       HealthDataAccess.READ_WRITE
//     ];
//     await health.requestAuthorization(types, permissions: permissions);
//
//     // write steps and blood glucose
//     bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
//     success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
//
//     // get the number of steps for today
//     var midnight = DateTime(now.year, now.month, now.day);
//     int? steps = await health.getTotalStepsInInterval(midnight, now);
//     print('steps: $steps');
//     print(healthData);
//   }
//
//
//   Future<int?> getSteps() async{
//     bool requested = await health.requestAuthorization(types);
//     int? steps = await health.getTotalStepsInInterval(midnight, now);
//     print('steps: $steps');
//     return steps;
//   }
// }