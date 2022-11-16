import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tutorial_app/feature/data/hive/gadget_model.dart';
import 'package:hive_tutorial_app/feature/data/hive/hive_name.dart';
import 'package:hive_tutorial_app/generated/locale_keys.g.dart';

class AppDialog extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  AppDialog({super.key});

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  late String brand;
  late String url;
  late String model;
  late String type;
  late String price;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Text(
        LocaleKeys.dialog_add.tr(),
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 3,
      backgroundColor: Colors.deepOrange[900],
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: _validateAndSave,
          child: Text(
            LocaleKeys.dialog_save.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            context.router.pop(true);
          },
          child: Text(
            LocaleKeys.dialog_cancel.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
      content: SizedBox(
          height: 384,
          width: 495,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.trim().isEmpty
                            ? LocaleKeys.dialog_fil.tr()
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          brand = value;
                        });
                      },
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.orange),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hoverColor: Colors.teal,
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(20)),
                          hintStyle: const TextStyle(color: Colors.white),
                          label: Text(LocaleKeys.dialog_brand.tr()),
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.trim().isEmpty
                            ? LocaleKeys.dialog_fil.tr()
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          model = value;
                        });
                      },
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.orange),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hoverColor: Colors.teal,
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(20)),
                          hintStyle: const TextStyle(color: Colors.white),
                          label: Text(LocaleKeys.dialog_model.tr()),
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.trim().isEmpty
                            ? LocaleKeys.dialog_fil.tr()
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          type = value;
                        });
                      },
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.orange),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hoverColor: Colors.teal,
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(20)),
                          hintStyle: const TextStyle(color: Colors.white),
                          label: Text(LocaleKeys.dialog_type.tr()),
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.trim().isEmpty
                            ? LocaleKeys.dialog_fil.tr()
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          price = value;
                        });
                      },
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.orange),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hoverColor: Colors.teal,
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(20)),
                          hintStyle: const TextStyle(color: Colors.white),
                          label: Text(LocaleKeys.dialog_price.tr()),
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      _onFormSubmit();
    }
  }

  void _onFormSubmit() {
    Box<GadgetModel> contactsBox = Hive.box<GadgetModel>(HiveBoxes.gadgetModel);
    contactsBox
        .add(GadgetModel(brand: brand, model: model, type: type, price: price));
    context.router.pop();
  }
}
