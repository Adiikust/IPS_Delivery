

import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';
import 'package:telephony/telephony.dart';

class NonDeliveredScreen extends StatefulWidget {
   const NonDeliveredScreen({Key? key}) : super(key: key);

  @override
  State<NonDeliveredScreen> createState() => _NonDeliveredScreenState();
}

class _NonDeliveredScreenState extends State<NonDeliveredScreen> {
  String SelectedCurrentValue ="Change Status";

List<DropdownMenuItem<String>> listDrop = [];
  dynamic _select;
 double opacit = 0.0;

 void loadData(){
   listDrop = [];
   listDrop.add(const DropdownMenuItem(value: '1',child: Text('Change Status'),));
   listDrop.add(const DropdownMenuItem(value: '2',child: Text('Delivered'),));
   listDrop.add(const DropdownMenuItem(value: '3',child: Text('Send out for delivery'),));
   listDrop.add(const DropdownMenuItem(value: '4',child: Text('Returned to sender'),));
   listDrop.add(const DropdownMenuItem(value: '5',child: Text('Missent'),));
   listDrop.add(const DropdownMenuItem(value: '6',child: Text('Retained'),));
 }
  final Telephony telephony = Telephony.instance;
 var i=0;
  final _formKey = GlobalKey<FormState>();
   final TextEditingController _phoneController =TextEditingController();
   final TextEditingController _msgController =TextEditingController();
   final TextEditingController _numController =TextEditingController();
  @override
  void initState() {
    super.initState();
    _phoneController.text = '55555';
    _msgController.text = 'Подпишись на канал :)';
    _numController.text = '10';
  }
  @override
  Widget build(BuildContext context) {
    final data= MediaQuery.of(context);
    loadData();

    return Scaffold(
      appBar: AppBar(title: const Text('IPSDelivery'),),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child:
              Column(
                children: [
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
                              child: DropdownButton(items: listDrop, value:_select,
                                hint:const Text("Change Status"),
                                underline: Container(),
                                onChanged: (value) {
                                setState((){
                                 //print(value.toString());
                                  _select = value;
                                  if(value == "3")
                                    {
                                      opacit = 1.0;
                                    }
                                  else{ opacit=0.0;}
                                });
                                },)

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget> [
                        Opacity(opacity: opacit,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 5),
                        child:TextFormField(
                          controller: _phoneController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                            border: OutlineInputBorder(),
                            hintText: "Enter Phone Number",
                            labelText: "Phone Number",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a number';
                            }
                            return null;
                          },
                        ),)),
                        SizedBox(height: data.size.height *0.04,),
                        Opacity(opacity: opacit,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child:TextFormField(
                              controller: _msgController,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                              border: OutlineInputBorder(),
                              hintText: "Write a massage",
                              labelText: "Massage",
                            ),validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter a Massage';
                              }
                              return null;
                            },

                            ),),),
                        SizedBox(height: data.size.height * 0.04,),
                        Opacity(opacity: opacit,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: _numController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                                border: OutlineInputBorder(),
                                hintText: "Number of Massage",
                                labelText: "Number of Massage",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter the value';
                                }
                                return null;
                              },

                            ),),),
                        SizedBox(height: data.size.height * 0.04,),
                        Opacity(opacity: opacit,
                          child:  ElevatedButton(onPressed: (){
                            _sendSMS();
                          }, child: const Text('send'),
                            /*onPressed: () async{
                      setState((){
                        i=int.parse(numController.text);
                      });
                      for(int k=1;k <=i;k++)
                      {
                        telephony.sendSms(to: phoneController.text, message: msgController.text);
                      }
                    }, child: const Text('Send Massage')*/
                          ),),

                      ],
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
  void _sendSMS() async {
    int _sms = 0;
    while (_sms < int.parse(_numController.text)) {
      telephony.sendSms(to: _phoneController.text, message: _msgController.text);
      _sms ++;
    }
  }
}



