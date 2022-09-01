import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List title = [
    "Black T-shirt",
    "Red T-shirt",
    "Blue T-shirt",
    "Green T-shirt"
  ];
  List before = ["20", "30", "40", "50"];
  List after = ["10", "20", "30", "40"];
  List img_url = [
    "https://img.joomcdn.net/a24f70d27ca2552e92aa45c9005827c82b915156_original.jpeg",
    "https://media.istockphoto.com/photos/red-tshirt-clipping-path-picture-id465485445?k=20&m=465485445&s=612x612&w=0&h=DyxRzfbIlXX_jkdiokeAJ4takk3q5VjX1VOkiUgrxy0=",
    "https://img.kytary.com/eshop_ie/velky_v2/na/637329305569630000/6a127d21/64771944/ant-tshirt-ant-blu-l.jpg",
    "https://www.rei.com/media/48a3f17e-e358-4ef3-bd9f-d024aa2183f1.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.white, Colors.pink])),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) {
                return Container(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 200, top: 15),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              title[i] += " Added to cart";
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                          label: Text("Add to cart")),
                    ),
                    ListTile(
                        title: Text("${title[i]}",
                            style:
                                TextStyle(fontSize: 25, color: Colors.purple)),
                        subtitle: Row(
                          children: [
                            Text(
                              "${before[i]}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.green,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "${after[i]}",
                              style: TextStyle(fontSize: 25, color: Colors.red),
                            )
                          ],
                        ),
                        leading: Image(
                          image: NetworkImage('${img_url[i]}'),
                          height: 200,
                          width: 100,
                        ),
                        trailing: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                title[i] += " Added to favorite";
                              });
                            },
                            icon: Icon(Icons.favorite, color: Colors.white),
                            label: Text(""))),
                    Divider(
                      height: 10,
                      thickness: 10,
                    ),
                  ],
                ));
              }),
        ),
      ),
    );
  }
}
