import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';

class DeliveredScreen extends StatefulWidget {
   const DeliveredScreen({Key? key}) : super(key: key);

  @override
  State<DeliveredScreen> createState() => _DeliveredScreenState();
}

class _DeliveredScreenState extends State<DeliveredScreen> {
  @override
  Widget build(BuildContext context) {

    final data= MediaQuery.of(context);
    /*List <User> userList = [];

    void addUserData (User user){
      setState((){
        userList.add(user);
      });
    }*/

    return Scaffold(
        appBar: AppBar(title: const Text('IPSDelivery'),),
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:data.size.height * 0.1,
              color: AppColors.kRed,
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 10,top: 10),
                child: Text('Status',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                    color: AppColors.kWhite,
                ),
                ),
              ),

            ),
            /*ListView.builder(itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(userList[index].articleId),
                  trailing: Text(userList[index].deliveryOption),
                ),
              );
            },itemCount:userList.length,
            ),*/
          ],
        ),

      ),
    );
  }
}
