import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({Key? key}) : super(key: key);

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {

  String SelectedCurrentValue ="Change Status";
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Write Some',
                  hintStyle: TextStyle(fontSize: 18),

                ),
              ),
              SizedBox(height: data.size.height * 0.02,),
              Container(
                width: double.infinity,
                height: 35,
                alignment: Alignment.center,
                color: Colors.black12,

                child:  const Text("SCAN ARTICLE",
                    style: TextStyle(fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter recepient name',
                  hintStyle: TextStyle(fontSize: 18),

                ),
              ),
              SizedBox(height: data.size.height * 0.04,),
              Container(
                width: double.infinity,
                height: 35,
                alignment: Alignment.center,
                color: Colors.black12,

                child:  const Text("Save",
                    style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
