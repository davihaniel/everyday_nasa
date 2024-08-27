import 'package:everyday_nasa/features/data/models/space_media_model.dart';
import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/space_media_mock.dart';
import '../../mocks/space_media_model_mock.dart';

void main() {

  test('should be a sublcass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    final result = SpaceMediaModel.fromJson(spaceMediaMock);
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expectedMap = {
      "explanation":
          "Do underground oceans vent through canyons on Saturn's moon Enceladus?  Long features dubbed tiger stripes are known to be spewing ice from the moon's icy interior into space, creating a cloud of fine ice particles over the moon's South Pole and creating Saturn's mysterious E-ring.  Evidence for this has come from the robot Cassini spacecraft that orbited Saturn from 2004 to 2017.  Pictured here, a high resolution image of Enceladus is shown from a close flyby.  The unusual surface features dubbed tiger stripes are visible in false-color blue.  Why Enceladus is active remains a mystery, as the neighboring moon Mimas, approximately the same size, appears quite dead. An analysis of ejected ice grains has yielded evidence that complex organic molecules exist inside Enceladus. These large carbon-rich molecules bolster -- but do not prove -- that oceans under Enceladus' surface could contain life.   Explore Your Universe: Random APOD Generator",
      "media_type": "image",
      "title": "Fresh Tiger Stripes on Saturn's Enceladus",
      "url":
          "https://apod.nasa.gov/apod/image/2408/EnceladusStripes_Cassini_960.jpg"
    };
    final result = tSpaceMediaModel.toMap();
    expect(result, expectedMap);
  });
}
