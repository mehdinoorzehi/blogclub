// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:blogclub/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme _style = Theme.of(context).textTheme;
    final _stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 34, right: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Mehdi!',
                      style: _style.titleSmall,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      height: 32,
                      width: 32,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, bottom: 24, top: 6),
                child: Text(
                  'Explore today',
                  style: _style.titleLarge,
                ),
              ),
              StoryList(stories: _stories, style: _style)
            ],
          ),
        ),
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required List<StoryData> stories,
    required TextTheme style,
  })  : _stories = stories,
        _style = style;

  final List<StoryData> _stories;
  final TextTheme _style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 110,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final _story = _stories[index];
            return Story(story: _story, style: _style);
          },
          itemCount: _stories.length,
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    super.key,
    required StoryData story,
    required TextTheme style,
  })  : _story = story,
        _style = style;

  final StoryData _story;
  final TextTheme _style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Column(
        children: [
          Stack(
            children: [
              _story.isViewed ? storyViewed() : storyViewNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${_story.iconFileName}',
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _story.name,
            style: _style.titleMedium,
          ),
        ],
      ),
    );
  }

  Container storyViewNormal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      padding: const EdgeInsets.all(2.5),
      width: 67,
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)]),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19), color: Colors.white),
        child: imageProfile(),
      ),
    );
  }

  Widget storyViewed() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: 67,
      height: 67,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(22),
        color: const Color(0xff7B8BB2),
        dashPattern: const [
          8,
          3,
        ],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: imageProfile(),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/img/stories/${_story.imageFileName}',
      ),
    );
  }
}
