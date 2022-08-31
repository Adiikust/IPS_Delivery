import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({Key? key}) : super(key: key);



  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
late Box<String> storeListData;
  //final _formKey = GlobalKey<FormState>();
 final TextEditingController _articleData =TextEditingController();
 final TextEditingController _deliveryOption =TextEditingController();
  String SelectedCurrentValue ="Change Status";
  String _data = '';

 _startBarcodeScanStream() async {
   return await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE).then((value) => setState(()=>_data = value));
  }

  @override
  void initState(){
   super.initState();
   storeListData = Hive.box<String>("adnan");
  }

  @override
  Widget build(BuildContext context) {
    final data =MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('AddArticles'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(height: data.size.height * 0.01,),
                const Text('Article Id',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: data.size.height * 0.01,),
                 TextField(
                   controller: _articleData,
                  decoration: InputDecoration(
                    hintText: _data,
                    hintStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                /* Container(
                   color: Colors.black12,
                   height: data.size.height * 0.060,
                     width: double.infinity,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 7,top: 13),
                       child: Text(_data,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                     )),*/
                SizedBox(height: data.size.height * 0.02,),
                InkWell(
                  onTap: (){
                    _startBarcodeScanStream();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 35,
                    alignment: Alignment.center,
                    color: Colors.black12,
                    child:  const Text("SCAN ARTICLE",
                        style: TextStyle(fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                SizedBox(height: data.size.height * 0.04,),
                const Text('Status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: data.size.height * 0.02,),
                Container(
                  width: 180,
                  height: 40,
                  color: Colors.black12,
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
              SizedBox(height: data.size.height * 0.04,),
              const Text('Delivery options',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                TextField(
                 controller: _deliveryOption,
                decoration: const InputDecoration(
                  hintText: 'Enter recepient name',
                  hintStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: data.size.height * 0.04,),
              InkWell(
                onTap: (){
                  final key = _articleData.text;
                  final value = _deliveryOption.text;
                  storeListData.put(key, value);
                  _deliveryOption.clear();
                  _articleData.clear();

                },
                child: Container(
                  width: double.infinity,
                  height: 35,
                  alignment: Alignment.center,
                  color: Colors.black12,

                  child:  const Text("Save",
                      style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
                SizedBox(height: data.size.height * 0.04,),
                ValueListenableBuilder(valueListenable: storeListData.listenable(),
                    builder: (context,Box<String>adnan,_)
                {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                        final key = adnan.keys.toList()[index];
                        final value = adnan.get(key);
                        return Card(
                          child: ListTile(
                            title: Text("$key",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle: Text("$value",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            trailing: InkWell(
                              onTap: (){
                                storeListData.delete(key);
                              },
                                child: const Icon(Icons.delete),),
                          ),
                        );
                      },
                       itemCount: storeListData.keys.toList().length,
                  );
                }
                ),
            ],
          ),
      ),
    )
    );
  }
}
