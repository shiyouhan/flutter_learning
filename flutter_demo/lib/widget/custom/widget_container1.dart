// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/tag.dart';

// 封装分类页面中列表中的每个Container组件
// ignore: must_be_immutable
class WidgetContainer1 extends StatelessWidget {
  ContainerInfo1 info1;
  final icons = [
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
  ];
  WidgetContainer1(this.info1, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      //  装饰整个Container
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.blue.shade600),
        color: Colors.blue.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  // border: Border(
                  //   top: BorderSide(
                  //     width: 3.0, //宽度
                  //     color: Colors.blue, //边框颜色
                  //   ),
                  //   bottom: BorderSide(
                  //     width: 3.0, //宽度
                  //     color: Colors.blue, //边框颜色
                  //   ),
                  // ),
                  ),
              child: _buildContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedOverflowBox(
                alignment: Alignment.center,
                size: Size.zero,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 50,
                    top: 10,
                  ),
                  child: Tag(
                    color: Colors.blue.shade600,
                    shadowHeight: 16.0,
                    size: const Size(24, 30),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            //  左侧leading图标区用一个container绘制一个圆形 ，文字为标题的第一个字母
            leading: Container(
              alignment: Alignment.center,
              width: 80,
              height: 80,
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 5,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    // 装饰形状、背景色、阴影等
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Container为圆形
                      color: Colors.blue.shade50,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                    child: Text(
                      info1.title.substring(0, 2),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    children: icons
                        .map((e) => Icon(
                              e,
                              color: Colors.blue.shade600,
                              size: 14,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            title: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Text(
                info1.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              info1.subTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 14),
            ),
            selected: false,
            contentPadding: const EdgeInsets.all(5),
            dense: false,
            onTap: () => {Navigator.pushNamed(context, info1.url)},
          ),
        ],
      ),
    );
  }
}

class ContainerInfo1 {
  late String title;
  late String subTitle;
  late String url;

  ContainerInfo1(this.title, this.subTitle, this.url);
}
