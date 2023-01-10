import 'package:inovola_tech_task/modules/courses/data_layer/services_impl/courses_service_impl.dart';
import 'package:inovola_tech_task/modules/courses/presentation_layer/managers/courses_provider.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(
    create: (context) => CoursesProvider(CoursesServiceImpl()),
  ),
];
