import 'package:chat_appilication/screens/screens/home_page.dart';
import 'package:chat_appilication/screens/screens/profile.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:flutter/material.dart';

class BottomBarPages extends StatefulWidget {
  @override
  State<BottomBarPages> createState() => _BottomBarPagesState();
}

class _BottomBarPagesState extends State<BottomBarPages> {
  int _selectedIndex = 0;

//  List<Widget> pages = [HomePage(), ProfileDetails()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0 ? HomePage() : ProfileDetails(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: ontap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          wSpace(),
                          Text(
                            "New Chat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
    );
  }

  void ontap(int index) {
    if (index == 1) {
      showOptionChat();
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  showOptionChat() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // contentPadding: EdgeInsets.only(bottom: 100),
          alignment: Alignment.bottomCenter,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: Container(
                      height: 250,
                      // width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          // for (var item in [1, 2, 3])
                          //   ListTile(
                          //     leading: Icon(Icons.chat),
                          //     title: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Text("New Chat"),
                          //         Text('Send a message to your contact')
                          //       ],
                          //     ),
                          //   )
                          CustomListTile(
                              "New Chat",
                              "Send a message to your contact",
                              Icon(Icons.chat_rounded)),
                          CustomListTile(
                              "Add Contact",
                              "Add a contact to be able to send messages",
                              Icon(Icons.contact_page_outlined)),
                          CustomListTile(
                              "New Community",
                              "Join the community around you",
                              Icon(Icons.group_sharp))
                        ],
                      )),
                ),

                //  OutlinedButton(onPressed: () {}, child: Text("Cancel")),
                Container(
                    height: 40,
                    width: 130,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  CustomListTile(String text, String text2, Icon icons) {
    return ListTile(
      leading: icons,
      title: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(text2),
    );
  }
}
