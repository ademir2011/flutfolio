import 'package:flutfolio/components/ccard_generic.dart';
import 'package:flutfolio/components/cheader.dart';
import 'package:flutfolio/models/certification.dart';
import 'package:flutter/material.dart';

class CertificationsPage extends StatelessWidget {
  final List<Certification> certifications;
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
          const CHeader(title: 'CERTIFICAÇÕES'),
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
                        CCardGeneric(
                          child: Image.network(certifications[index].imageUrl),
                          size: const Size(0, 300),
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
