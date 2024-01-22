import 'package:stepp_app/constants/mock_data.dart';

class PostModel {
  final String imagePath;
  final String content;
  final double stepped;
  PostModel({
    required this.imagePath,
    required this.content,
    required this.stepped,
  });

  static final List<PostModel> mockSteppPlace = [
    PostModel(
      imagePath: MockData.mockPostImage1,
      content: "นักเที่ยวขาประจำจังหวัดเชียงใหม่คงรู้กันดีว่า"
          "นอกจากที่นี่จะมีสถานที่ท่องเที่ยวสวยๆ งามๆ มากมายให้เที่ยวได้แบบไม่ซ้ำแล้ว"
          "อาหารการกินก็อุดมสมบูรณ์ไม่แพ้กัน มีร้านอาหารและคาเฟ่ผุดขึ้นมากมายพอๆ"
          "กับดอกเห็ดเลยทีเดียว แต่ถ้ามาถึงเชียงใหม่แล้วไม่แวะไป ‘ร้านข้าวซอย’"
          "ก็คงต้องบอกกับตัวเองเลยว่า คุณพลาดมาก!!",
      stepped: 257000,
    ),
    PostModel(
      imagePath: MockData.mockPostImage2,
      content: "นักเที่ยวขาประจำจังหวัดเชียงใหม่คงรู้กันดีว่า"
          "นอกจากที่นี่จะมีสถานที่ท่องเที่ยวสวยๆ งามๆ มากมายให้เที่ยวได้แบบไม่ซ้ำแล้ว"
          "อาหารการกินก็อุดมสมบูรณ์ไม่แพ้กัน มีร้านอาหารและคาเฟ่ผุดขึ้นมากมายพอๆ"
          "กับดอกเห็ดเลยทีเดียว แต่ถ้ามาถึงเชียงใหม่แล้วไม่แวะไป ‘ร้านข้าวซอย’"
          "ก็คงต้องบอกกับตัวเองเลยว่า คุณพลาดมาก!!",
      stepped: 257000,
    ),
    PostModel(
      imagePath: MockData.mockPostImage3,
      content: "นักเที่ยวขาประจำจังหวัดเชียงใหม่คงรู้กันดีว่า"
          "นอกจากที่นี่จะมีสถานที่ท่องเที่ยวสวยๆ งามๆ มากมายให้เที่ยวได้แบบไม่ซ้ำแล้ว"
          "อาหารการกินก็อุดมสมบูรณ์ไม่แพ้กัน มีร้านอาหารและคาเฟ่ผุดขึ้นมากมายพอๆ"
          "กับดอกเห็ดเลยทีเดียว แต่ถ้ามาถึงเชียงใหม่แล้วไม่แวะไป ‘ร้านข้าวซอย’"
          "ก็คงต้องบอกกับตัวเองเลยว่า คุณพลาดมาก!!",
      stepped: 257000,
    ),
  ];
}