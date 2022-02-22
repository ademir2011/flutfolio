import 'package:flutfolio/src/stores/project_store.dart';
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
      title: Text(isCreateOrIsNotEdit ? 'Cadastrar projeto' : 'Editar projeto'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: projectStore.titleController,
                decoration: const InputDecoration(hintText: 'Título'),
                validator: projectStore.titleValidate,
              ),
              TextFormField(
                controller: projectStore.descriptionController,
                decoration: const InputDecoration(hintText: 'Descrição'),
                validator: projectStore.descriptionValidate,
              ),
              TextFormField(
                controller: projectStore.tagsController,
                decoration: const InputDecoration(hintText: 'Tags ( Separado por vírgula )'),
                validator: projectStore.tagsValidate,
              ),
              TextFormField(
                controller: projectStore.githubLinkController,
                decoration: const InputDecoration(hintText: 'Github Link'),
                validator: projectStore.linkValidate,
              ),
              TextFormField(
                controller: projectStore.imagesLinkController,
                decoration: const InputDecoration(hintText: 'Images Link'),
                validator: projectStore.linkValidate,
              ),
              TextFormField(
                controller: projectStore.videosLinkController,
                decoration: const InputDecoration(hintText: 'Videos Link'),
                validator: projectStore.linkValidate,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Fechar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Cadastrar'),
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
