import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:test_project/router/router.dart';
import 'package:test_project/widgets/widgets.dart';

import '../data/data.dart';
import '../generated/l10n.dart';
import '../providers/date_provider.dart';
import '../providers/item/item.dart';
import '../utils/utils.dart';

@RoutePage()
class EditItemScreen extends ConsumerStatefulWidget {
  final Item item;

  const EditItemScreen({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<EditItemScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionsController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _titleController.text = widget.item.title;
    _descriptionsController.text = widget.item.descriptions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getGlobalAppBar(
          text: S.of(context).editElement, needBackBtn: true, ref: ref),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
              key: _fbKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderTextField(
                    name: "title",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    controller: _titleController,
                    autocorrect: true,
                    enableSuggestions: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: S.of(context).itemName,
                      hintStyle: const TextStyle(color: Colors.black54),
                      alignLabelWithHint: true,
                      fillColor: Colors.black12,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 36),
                    child: FormBuilderTextField(
                      name: "description",
                      minLines: 6,
                      maxLines: 6,
                      controller: _descriptionsController,
                      autocorrect: true,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      enableSuggestions: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: S.of(context).description,
                        hintStyle: const TextStyle(color: Colors.black54),
                        alignLabelWithHint: true,
                        fillColor: Colors.black12,
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                  ),
                  GlobalBtn(
                    text: S.of(context).save,
                    onTap: _createTask,
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _createTask() async {
    if (_fbKey.currentState!.saveAndValidate()) {
      final title = _titleController.text.trim();
      final description = _descriptionsController.text.trim();
      final date = ref.watch(dateProvider);
      final item = widget.item.copyWith(
        title: title,
        time: DateFormat.Hm().format(date),
        date: DateFormat.yMd().format(date),
        descriptions: description,
      );

      await ref.read(itemsProvider.notifier).updateItem(item).then((value) {
        AppAlerts.displaySnackbar(
            context, S.of(context).itemUpdatedSuccessfully);
        ref.read(appRouterProvider).pop();
      });
    }
  }
}
