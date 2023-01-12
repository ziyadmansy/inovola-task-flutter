import 'package:http/http.dart';
import 'package:inovola_tech_task/modules/courses/domain_layer/entities/course_details_entity.dart';
import 'package:inovola_tech_task/modules/courses/domain_layer/services/course_service.dart';
import 'package:inovola_tech_task/shared/api_routes.dart';

class CoursesServiceImpl implements CourseService {

  // Overriden service method that gets course details
  // from test remote API
  @override
  Future<CourseDetailsEntity?> getCourseDetails() async {
    final url = Uri.parse(ApiRoutes.courseDetails);
    final response = await get(
      url,
    );
    return CourseDetailsEntity.fromJson(response.body);
  }
}
