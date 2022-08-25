

import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';
import 'package:telephony/telephony.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  final TextEditingController phoneController =TextEditingController();
  final TextEditingController msgController =TextEditingController();
  final TextEditingController numController =TextEditingController();
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
                      child: Column(children: <Widget> [
                        Opacity(opacity: opacit,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 5),
                        child:TextFormField(
                          controller: phoneController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                            border: OutlineInputBorder(),
                            hintText: "Enter Phone Number",
                            labelText: "Phone Number",
                          ),
                          validator: MultiValidator([
                            MinLengthValidator(11, errorText: 'Number must be 11 digits long'),
                            RequiredValidator(errorText: 'Please enter your Number'),
                          ]),
                        ),)),
                        SizedBox(height: data.size.height *0.04,),
                        Opacity(opacity: opacit,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: msgController,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                              border: OutlineInputBorder(),
                              hintText: "Write a massage",
                              labelText: "Massage",
                            ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Please enter your Massage'),
                              ]),

                            ),),),
                        SizedBox(height: data.size.height * 0.04,),
                        Opacity(opacity: opacit,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: numController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                                border: OutlineInputBorder(),
                                hintText: "Number of Massage",
                                labelText: "Number of Massage",
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Please enter your Massage'),
                              ]),

                            ),),),
                        SizedBox(height: data.size.height * 0.04,),

                      ],),
                    ),

                  ),
                   Opacity(opacity: opacit,
                    child:  ElevatedButton(onPressed: () async{
                      setState((){
                        i=int.parse(numController.text);
                      });
                      for(int k=1;k <=i;k++)
                      {
                        telephony.sendSms(to: phoneController.text, message: msgController.text);
                      }
                    }, child: const Text('Send Massage')),),

                ],
              ),
        ),
      ),
    );


  }
}

