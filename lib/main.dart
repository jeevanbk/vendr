import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        home: HomeDashboard(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: Size(375, 667),
    );
  }
}

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int currentIndex = 0;
  final searchGrey = Color(0x1F767680);
  String menuIcon="assets/menu.svg";
  String addContactsIcon="assets/addContact.svg";
  String vendorIcon="assets/vendorIcon.svg";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "My Vendors",
            style: TextStyle(color: Colors.black),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
                menuIcon,

            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 16.w),
              child:SvgPicture.asset(
                  addContactsIcon,
                 height: 18.h,
                 width: 18.w,
              )
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(),
                  SizedBox(height: 16.h),
                  CountryList(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Color(0xffFF7F50),
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Vendors',
               ),
            BottomNavigationBarItem(
                icon: Icon(Icons.storefront),
                label: 'Showroom',
               ),
          ],
        ),
      ),
    );
  }

  Widget SearchBar() {
    return Container(
      color: Colors.white30,
      width: MediaQuery.of(context).size.width,
      height: 36.h,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Search",
          prefixIcon: Icon(Icons.search),
          fillColor: searchGrey,
          filled: true,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            // borderSide: new BorderSide(
            //   color: customGrey
            // ),
          ),
        ),
      ),
    );
  }

  Widget CountryList() {
    return SizedBox(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width * 0.99,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static.toiimg.com/thumb/msid-46426157,width-400,height-300,resizemode-75/46426157.jpg'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kontour Kont",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          Text("Bangalore,India",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                )
              ],
            );
          }),
    );
  }
}
