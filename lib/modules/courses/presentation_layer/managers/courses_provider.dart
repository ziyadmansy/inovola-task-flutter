import 'package:flutter/foundation.dart';
import 'package:inovola_tech_task/modules/courses/domain_layer/entities/course_details_entity.dart';
import 'package:inovola_tech_task/modules/courses/domain_layer/services/course_service.dart';

class CoursesProvider extends ChangeNotifier {
  final CourseService coursesService;

  CoursesProvider(this.coursesService);

  bool isLoading = true;
  bool isLiked = false;

  int currentSliderIndex = 0;

  CourseDetailsEntity? courseDetails;

  void changeIndex(int newIndex) {
    currentSliderIndex = newIndex;
    notifyListeners();
  }

  void toggleLikeStatus() {
    isLiked = !isLiked;
    courseDetails?.toggleLikeStatus(isLiked);
    notifyListeners();
  }

  Future<void> getCourseDetails() async {
    try {
      isLoading = true;
      notifyListeners();

      courseDetails = await coursesService.getCourseDetails();
      print(courseDetails);
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
