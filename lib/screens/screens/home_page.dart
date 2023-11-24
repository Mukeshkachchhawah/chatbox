import 'package:chat_appilication/screens/screens/chat_screen.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/list_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage("assets/images/c.png"), scale: 20)),
        ),
        title: Text("Chatbox"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Stroy(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              ],
            ),
          ),
          Expanded(child: userChatList())
        ],
      ),
    );
  }

  Widget Stroy() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(imageStroy.length, (index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${imageStroy[index]['image']}",
                      ),
                      fit: BoxFit.cover)),
            ),
            Text(
              "${imageStroy[index]['userName']}",
            )
          ],
        );
      })),
    );
  }

  Widget userChatList() {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      itemCount: imageStroy.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreens(),
                ));
          },
          child: ListTile(
            leading: Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  //  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${imageStroy[index]['image']}",
                      ),
                      fit: BoxFit.cover)),
            ),
            title: Text("${imageStroy[index]['userName']}"),
            subtitle: Text("Hy fluttter"),
            trailing: Column(
              children: [
                Text("02:30 PM"),
                hSpace(mheight: 10.0),
                CircleAvatar(
                  radius: 14,
                  child: Center(
                    child: Text("3"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
