import 'package:flutter/material.dart';
import 'package:intropage/homepage.dart';
import 'Strings.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String id = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context,HomePage.id );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Text('Skip',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: 18),),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState((){
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: 'assets/images/img.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: 'assets/images/img_1.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent
              ),
              makePage(
                image: 'assets/images/img_2.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepThreeContent
              )

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }
  Widget makePage ({image,title,content,reverse = false}){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 10,),
            ],
          ),
          Text(content,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),)
        ],
      ),

    );
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 6,
      width: isActive ? 30 :6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  List <Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i=0;i<3;i++){
      if(currentIndex ==i){
        indicators.add(_indicator(true));
      }
      else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}