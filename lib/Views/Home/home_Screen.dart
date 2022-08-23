
import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dataController = DataController();


   List screens = [
     const DeliveredScreen(),
     const NonDeliveredScreen(),
     const SendOutDeliveryScreen(),
     const ReturnScreen(),
     const MissentScreen(),
     const RetainedStoreScreen(),
     const AddArticleScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    final data=MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text("IPSDelivery"),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},),
          ],
        ),
        body: SafeArea(

          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
              ),
              itemCount: _dataController.dataController.length,
              itemBuilder: (context, index) {
                return Padding(padding: const EdgeInsets.all(8),
                  child: InkWell(
                      onTap: () {
                        setState((){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => screens[index]),
                          );
                        });
                        },
                      child: Card(
                        elevation: 1,
                       // color: Colors.amberAccent,
                        child: Column(
                          children: [
                            Image.asset(_dataController.dataController[index]!.pathImg.toString(),
                                height: 100, fit: BoxFit.fill),
                            SizedBox(height: data.size.height *0.02,),
                            Text(_dataController.dataController[index]!.title.toString(),
                            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                                                     ],
                        ),
                      )
                  ),
                );
              }
          ),
        )
    );
  }
}



