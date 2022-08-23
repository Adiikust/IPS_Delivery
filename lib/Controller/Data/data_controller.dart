import 'package:ipsdelivery/Controller/Extend/extend_Screen.dart';


class DataController   {
  List<DataModel?> dataController = [
    DataModel(
      pathImg: 'images/delivery.png',
      title: 'Delivered',

    ),
    DataModel(
      pathImg: 'images/nonDelivery.png',
      title: 'Non Delivered',

    ),
    DataModel(
      pathImg: 'images/sent.png',
      title: 'Send out for Delivery',

    ),
    DataModel(
      pathImg: 'images/return.png',
      title: 'Return to Sender',

    ),
    DataModel(
      pathImg: 'images/home.png',
      title: 'Missent',

    ),
    DataModel(
      pathImg: 'images/Store.png',
      title: 'Retained To Store',

    ),
    DataModel(
      pathImg: 'images/Add.png',
      title: 'Add articles',

    ),

  ];
}


