import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartAI extends StatefulWidget {
  const SmartAI({Key? key}) : super(key: key);



  @override
  State<SmartAI> createState() => _SmartAIState();
}

class _SmartAIState extends State<SmartAI> {
  double fem=1;
  double ffem= 0.9;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: HtmlWidget(
        '<iframe src="https://ora.ai/embed/54489f5c-80bc-42c1-9ce8-211719b1cc81" style="height: 500px;"></iframe>',
        factoryBuilder: () => MyWidgetFactory(),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
