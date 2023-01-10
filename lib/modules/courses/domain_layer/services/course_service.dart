import 'package:inovola_tech_task/modules/courses/domain_layer/entities/course_details_entity.dart';

abstract class CourseService {
  Future<CourseDetailsEntity> getCourseDetails();
}