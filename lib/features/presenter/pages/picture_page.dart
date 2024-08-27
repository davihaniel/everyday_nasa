import 'package:everyday_nasa/features/presenter/controllers/home_controller.dart';
import 'package:everyday_nasa/features/presenter/widgets/description_bottom_sheet.dart';
import 'package:everyday_nasa/features/presenter/widgets/image_network_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/space_media_entity.dart';
import '../widgets/custom_video_player.dart';
import '../widgets/page_slider_up.dart';

// ignore: must_be_immutable
class PicturePage extends StatefulWidget {
  DateTime? dateSelected;

  PicturePage({
    super.key,
    this.dateSelected,
  });

  PicturePage.fromArgs(dynamic arguments, {super.key}) {
    dateSelected = arguments['dateSelected'];
  }

  static void navigate(DateTime? dateSelected) {
    Modular.to.pushNamed(
      '/picture',
      arguments: {'dateSelected': dateSelected},
    );
  }

  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {

  var controller = Modular.get<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.getSpaceMediaFromDate(widget.dateSelected!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScopedBuilder(
        store: controller,
        onLoading: (context) => const Center(child:  CircularProgressIndicator()),
        onError: (context, error) => Center(
          child: Text(
            'An error occurred, try again later.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ),
        onState: (context, SpaceMediaEntity spaceMedia) {
          return PageSliderUp(
            onSlideUp: () => showDescriptionBottomSheet(
              context: context,
              title: spaceMedia.title,
              description: spaceMedia.description,
            ),
            child: spaceMedia.mediaType == 'video' && spaceMedia.mediaUrl != null
                ? CustomVideoPlayer(spaceMedia)
                : spaceMedia.mediaType == 'image' && spaceMedia.mediaUrl != null
                    ? ImageNetworkWithLoader(spaceMedia.mediaUrl!)
                    : Container(),
          );
        },
      ),
    );
  }
}