import 'package:flutfolio/src/models/certification_model.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class CertificationsPage extends StatelessWidget {
  final List<CertificationModel> certifications;
  const CertificationsPage({
    Key? key,
    required this.certifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(title: 'CERTIFICAÇÕES'),
          Expanded(
            child: ListView.builder(
                itemCount: certifications.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              certifications[index].title,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              certifications[index].description,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        CardGenericWidget(
                          child: Image.network(
                            certifications[index].imageUrl,
                            width: 500,
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
