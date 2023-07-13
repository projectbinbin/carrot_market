import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    datas = [
      {
        'cid': '1',
        'image': 'assets/images/ara-1.jpg',
        'title': '네메시스 축구화275',
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      },
      {
        'cid': '2',
        'image': 'assets/images/ara-2.jpg',
        'title': 'LA갈비 5kg팔아요~',
        'location': '제주 제주시 아라동',
        'price': '100000',
        'likes': '5'
      },
      {
        'cid': '3',
        'image': 'assets/images/ara-3.jpg',
        'title': '치약팝니다',
        'location': '제주 제주시 아라동',
        'price': '5000',
        'likes': '0'
      },
      {
        'cid': '4',
        'image': 'assets/images/ara-4.jpg',
        'title': '[풀박스]맥북프로16인치 터치바 스페이스그레이',
        'location': '제주 제주시 아라동',
        'price': '2500000',
        'likes': '6'
      },
      {
        'cid': '5',
        'image': 'assets/images/ara-5.jpg',
        'title': '디월트존기임팩',
        'location': '제주 제주시 아라동',
        'price': '150000',
        'likes': '2'
      },
      {
        'cid': '6',
        'image': 'assets/images/ara-6.jpg',
        'title': '갤럭시s10',
        'location': '제주 제주시 아라동',
        'price': '180000',
        'likes': '2'
      },
      {
        'cid': '7',
        'image': 'assets/images/ara-7.jpg',
        'title': '선반',
        'location': '제주 제주시 아라동',
        'price': '15000',
        'likes': '2'
      },
      {
        'cid': '8',
        'image': 'assets/images/ara-8.jpg',
        'title': '냉장 쇼케이스',
        'location': '제주 제주시 아라동',
        'price': '80000',
        'likes': '3'
      },
      {
        'cid': '9',
        'image': 'assets/images/ara-9.jpg',
        'title': '대우 미니냉장고',
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '3'
      },
      {
        'cid': '10',
        'image': 'assets/images/ara-10.jpg',
        'title': '멜킨스 풀업 턱걸이 판매합니다.',
        'location': '제주 제주시 아라동',
        'price': '50000',
        'likes': '7'
      },
    ];
  }

  AppBar _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        child: PopupMenuButton<String>(
          onSelected: (String value) {},
          offset: Offset(0, 42),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              1),
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: 'ara',
                child: Text('아라동'),
              ),
              PopupMenuItem(
                value: 'ora',
                child: Text('오라동'),
              ),
              PopupMenuItem(
                value: 'donam',
                child: Text('도남동'),
              ),
            ];
          },
          child: const Row(
            children: [
              Text('아리동'),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/bell.svg',
            width: 22,
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  datas[index]['image']!,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      datas[index]['title']!,
                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      datas[index]['location']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      calcStringToWon(datas[index]['price']!),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/heart_off.svg',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(datas[index]['likes']!),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.5),
        );
      },
      itemCount: datas.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  String calcStringToWon(String priceString) {
    final oCcy = NumberFormat('#,###', 'ko-KR');
    return '${oCcy.format(int.parse(priceString))}원';
  }
}
