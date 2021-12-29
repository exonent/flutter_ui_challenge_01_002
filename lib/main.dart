import 'package:flutter_ui_challenge_01_02/Widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge_01_02/Constants/constants.dart';
import 'package:flutter_ui_challenge_01_02/Data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Challenge 01 02',
      debugShowCheckedModeBanner: false,
      home: UserPage(username: 'Flutter Demo Home Page'),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.username}) : super(key: key);

  final String username;
  final bool colorTheme = true; //True = light  ||  False = Dark

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          //HEADER IMAGE
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        headerContent.image,
                      ),
                      scale: 1.8,
                      alignment: const Alignment(-0.6, 1),
                      fit: BoxFit.none),
                ),
              ),
            ],
          ),
          //CONTENT AREA - WHITE & DARK BOX
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: changeTheme().cambiarTemplate("background"),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Icon Menu - Menu
          Positioned(
            top: 30,
            bottom: 0,
            left: 10,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (changeTheme.theme) {
                    changeTheme.theme = false;
                  } else {
                    changeTheme.theme = true;
                  }
                });
              },
              child: Stack(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: kPinkBackgroud,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // CONTENT AREA - DATA
          Positioned(
            top: 140,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    image: DecorationImage(
                        image: AssetImage(
                          userData.image,
                        ),
                        scale: 1.8,
                        alignment: const Alignment(-0.6, 1),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      userData.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: changeTheme().cambiarTemplate("textColor")),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      userData.description,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: changeTheme().cambiarTemplate("title")),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 70, right: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            dataInTitle(value: "67", textData: "Games"),
                            dataInTitle(value: "12k", textData: "Followers"),
                            dataInTitle(value: "150", textData: "Following"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 6,
                          child: Container(
                              height: 20, child: const CategoryList()),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => {},
                                child: const Text("Following"),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: kPinkBackgroud,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 20),
                        itemCount: previews.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(previews[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // NAVBAR
      bottomNavigationBar: const customNavBar(),
    );
  }
}

class dataInTitle extends StatelessWidget {
  const dataInTitle({Key? key, required this.value, required this.textData})
      : super(key: key);

  final String value;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: changeTheme().cambiarTemplate("textColor")),
        ), //Extraer a un widget "titleText(texto)"
        const SizedBox(
          height: 5,
        ),
        Text(
          textData,
          style: TextStyle(color: Colors.grey.shade600),
        ), //Extraer a un widget "subTitleText(texto)"
      ],
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final categoryList = ['Games', 'Favorites', "Last Played"];
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            currentSelected = index;
          });
        },
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            categoryList[index],
            style: TextStyle(
                fontSize: currentSelected == index ? 18.0 : 12.0,
                fontWeight: currentSelected == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: currentSelected == index
                    ? changeTheme().cambiarTemplate("textColor")
                    : Colors.grey),
          ),
        ),
      ),
      separatorBuilder: (_, index) => const SizedBox(width: 10),
      itemCount: categoryList.length,
    );
  }
}
