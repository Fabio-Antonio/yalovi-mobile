import 'package:flutter/material.dart';
import 'package:platzi_trips_app/core/utils/colors.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/tabs_list_dto.dart';

class HistoryCard extends StatelessWidget {
  TabListDto? _history;

  HistoryCard(this._history);

  @override
  Widget build(BuildContext context) {
    final statusLabel = Container(
        padding: EdgeInsets.fromLTRB(250, 5, 15, 10),
        decoration: BoxDecoration(
            color: ColorsHandler.parseColor(_history?.labelBackground ?? ''),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: EdgeInsets.all(2.0),
            child: SizedBox(
                child: Text(_history?.labelText ?? "",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )))));

    final historyInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 5.0, left: 15,top: 11),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text("Código",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )))),
            Container(
                margin: EdgeInsets.only(bottom: 5.0, left: 110),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Text(_history?.shopCode ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )))),
          ],
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 15),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text("Fecha de compra",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))),
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 110),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(_history?.date ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))))
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 15),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text("Dirección",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))),
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 110),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(_history?.address ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))))
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 15),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text("Total",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))),
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 110),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(_history?.total ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))))
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 15),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(_history?.deliveryDate != 'null' ? 'Fecha de entrega' : '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )))),
          Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 110),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child:  Text(_history?.deliveryDate != 'null' ? _history?.deliveryDate ?? '' : '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))))
        ]),

      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[statusLabel, historyInfo],
      ),
    );
  }
}
