

import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';

class RetainedStoreScreen extends StatefulWidget {
  const RetainedStoreScreen({Key? key}) : super(key: key);

  @override
  State<RetainedStoreScreen> createState() => _RetainedStoreScreenState();
}

class _RetainedStoreScreenState extends State<RetainedStoreScreen> {
  String SelectedCurrentValue ="Change Status";

  @override
  Widget build(BuildContext context) {
    final data= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('IPSDelivery'),),
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child:
        Container(
          width: double.infinity,
          height:data.size.height * 0.1,
          color: AppColors.kRed,
          alignment: Alignment.topLeft,
          child: Row(
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 10,top: 10),
                child: Text('Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.kWhite,
                  ),
                ),
              ),
              SizedBox(width: data.size.width *0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Container(
                  width: 175,
                  height: 30,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: DropdownButton<String>(
                      underline: Container(),
                        value: SelectedCurrentValue,
                        items: const [
                          DropdownMenuItem(value: 'Change Status',child:Text('Change Status'),),
                          DropdownMenuItem(value: 'Delivered',child:Text('Delivered'),),
                          DropdownMenuItem(value: 'CSend out for delivery',child:Text('Send out for delivery'),),
                          DropdownMenuItem(value: 'Returned to sender',child:Text('Returned to sender'),),
                          DropdownMenuItem(value: 'Missent',child:Text('Missent'),),
                          DropdownMenuItem(value: 'CRetained',child:Text('Retained'),),
                        ], onChanged: (value){
                      setState((){
                        SelectedCurrentValue = value!;
                      });

                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
