import 'package:flutfolio/src/stores/project_store.dart';
import 'package:flutfolio/src/utils/generic_show_dialog.dart';
import 'package:flutfolio/src/utils/icon_helper.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/confirm_remove_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class CardWidget extends StatelessWidget {
  final projectStore = ProjectStore();
  final void Function() updateFunction;
  final String cardId;
  final String title;
  final String description;
  final String tags;
  final String gitUrl;
  final bool isAutenticated;

  CardWidget({
    Key? key,
    required this.updateFunction,
    required this.cardId,
    required this.title,
    required this.description,
    this.isAutenticated = false,
    this.tags = '',
    this.gitUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardGenericWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 10),
          // Wrap(
          //   children: tags
          //       .map((tag) => TagWidget(
          //             title: tag.title,
          //           ))
          //       .toList(),
          // ),
          const SizedBox(height: 10),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                icon: ImageIcon(
                  AssetImage(
                    IconHelper.getPath(IconName.github),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  js.context.callMethod('open', [gitUrl]);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.image,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  // js.context.callMethod('open', [gitUrl]);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.video_collection_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  // js.context.callMethod('open', [gitUrl]);
                },
              ),
              if (isAutenticated) Spacer(),
              if (isAutenticated)
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.create,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: updateFunction,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () {
                        GenericShowDialog.showGenericFormDialog(context, onAction: () async {
                          projectStore.removeDefault(cardId);
                        });
                      },
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}
