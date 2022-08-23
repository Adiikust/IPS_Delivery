import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';

class MissentScreen extends StatelessWidget {
  const MissentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('IPSDelivery'),),
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Container(
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

      ),
    );
  }
}
