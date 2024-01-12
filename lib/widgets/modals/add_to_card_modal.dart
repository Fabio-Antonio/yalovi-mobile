import 'package:flutter/material.dart';
import 'package:platzi_trips_app/core/utils/dynamic_size.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/view/widget/color_section_list.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/view/widget/standar_section.dart';
import 'package:platzi_trips_app/widgets/buttonShop.dart';

class addToCardModal extends StatefulWidget {
  final List<SelectSectionDto>? selectSections;

  addToCardModal({Key? key, this.selectSections}) : super(key: key);

  @override
  State<addToCardModal> createState() => _addToCardModal();
}

class _addToCardModal extends State<addToCardModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: DynamicSize.getDynamicSize<SelectSectionDto>(
                100.0, widget.selectSections ?? [], 800.0), // Set a fixed height or adjust as needed
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: widget.selectSections?.length,
              itemBuilder: (BuildContext context, int index) {
                var selection = widget.selectSections?[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      selection?.title ?? "",
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    selection?.isColor ?? false
                        ? colorSection(selection?.values ?? [], 0)
                        : getStandarSection(selection?.values ?? [], 0)
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buttonShop(
              tittle: 'Add to Cart',
              onPressed: () {
                Navigator.pop(context);

                // Let's show a snackbar when an item is added to the cart
                final snackbar = SnackBar(
                  content: Text("Item added to cart"),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              })
        ],
      ),
    );
  }
}
