import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inovola_tech_task/modules/courses/presentation_layer/managers/courses_provider.dart';
import 'package:inovola_tech_task/shared/shared.dart';
import 'package:inovola_tech_task/shared/stateful_widget_wrapper.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final coursesProvider = Provider.of<CoursesProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return StatefulWrapper(
      onInit: () {
        Future.delayed(
          Duration.zero,
          () async {
            await coursesProvider.getCourseDetails();
          },
        );
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: coursesProvider.toggleLikeStatus,
              icon: Icon(
                coursesProvider.isLiked ? Icons.star : Icons.star_outline,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
              ),
            ),
          ],
        ),
        body: coursesProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : coursesProvider.courseDetails == null
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Something went wrong, please try again'),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Retry',
                          ),
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CarouselSlider.builder(
                                    carouselController: _controller,
                                    itemCount: coursesProvider
                                        .courseDetails!.imgsUrl.length,
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      enableInfiniteScroll: true,
                                      pauseAutoPlayOnTouch: true,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        coursesProvider.changeIndex(index);
                                      },
                                    ),
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        SizedBox(
                                      width: screenSize.width,
                                      child: Image.network(
                                        coursesProvider
                                            .courseDetails!.imgsUrl[itemIndex],
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: coursesProvider
                                          .courseDetails!.imgsUrl
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        return GestureDetector(
                                          onTap: () => _controller
                                              .animateToPage(entry.key),
                                          child: Container(
                                            width: coursesProvider
                                                        .currentSliderIndex ==
                                                    entry.key
                                                ? 16
                                                : 12.0,
                                            height: coursesProvider
                                                        .currentSliderIndex ==
                                                    entry.key
                                                ? 16
                                                : 12.0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 4.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white.withOpacity(
                                                coursesProvider
                                                            .currentSliderIndex ==
                                                        entry.key
                                                    ? 0.9
                                                    : 0.4,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '# ${coursesProvider.courseDetails!.interest}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    Text(
                                      coursesProvider.courseDetails!.title,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          Shared.getArabicFormattedDate(
                                              coursesProvider
                                                  .courseDetails!.date),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.push_pin_outlined,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          coursesProvider
                                              .courseDetails!.address,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            coursesProvider
                                                .courseDetails!.trainerImg,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          coursesProvider
                                              .courseDetails!.trainerName,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      coursesProvider
                                          .courseDetails!.trainerInfo,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    const Divider(),
                                    const Text(
                                      'عن الدورة',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    Text(
                                      coursesProvider
                                          .courseDetails!.occasionDetail,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    const Divider(),
                                    const Text(
                                      'تكلفة الدورة',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    ...coursesProvider
                                        .courseDetails!.reserveTypes
                                        .map((res) => ListTile(
                                              contentPadding:
                                                  const EdgeInsets.all(0),
                                              title: Text(
                                                res.name,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Cairo',
                                                ),
                                              ),
                                              trailing: Text(
                                                '\$${res.price.toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Cairo',
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff703081),
                              Color(0xff913faa),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: const Text(
                            'قم بالحجز الآن',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
