import 'package:flutfolio/src/stores/project_store.dart';
import 'package:flutfolio/src/widgets/textinput_widget.dart';
import 'package:flutter/material.dart';

class FormProjectPage extends StatefulWidget {
  final String? docRef;
  const FormProjectPage({
    Key? key,
    this.docRef,
  }) : super(key: key);

  @override
  _FormProjectPageState createState() => _FormProjectPageState();
}

class _FormProjectPageState extends State<FormProjectPage> {
  final projectStore = ProjectStore();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isCreateOrIsNotEdit = widget.docRef == null ? true : false;

    if (widget.docRef != null) {
      projectStore.initUpdate(widget.docRef!);
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      title: Text(
        isCreateOrIsNotEdit ? 'Cadastrar projeto' : 'Editar projeto',
        style: Theme.of(context).textTheme.headline2,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormInputWidget(
                  controller: projectStore.titleController,
                  hintText: 'Título',
                  validator: projectStore.titleValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: projectStore.descriptionController,
                  hintText: 'Descrição',
                  validator: projectStore.descriptionValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: projectStore.tagsController,
                  hintText: 'Tags  Separado por vírgula )',
                  validator: projectStore.tagsValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: projectStore.githubLinkController,
                  hintText: 'Github ink',
                  validator: projectStore.linkValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: projectStore.imagesLinkController,
                  hintText: 'Images ink',
                  validator: projectStore.linkValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: projectStore.videosLinkController,
                  hintText: 'Videos ink',
                  validator: projectStore.linkValidate,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              'Fechar',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              'Cadastrar',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await projectStore.addProject();
              Navigator.of(context).pushNamed('/');
            }
          },
        ),
      ],
    );
  }
}
