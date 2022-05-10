import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/features/core/utils/forms/input_formatters/input_formatters.dart';
import 'package:wepsys_contact_list/features/core/utils/forms/input_validators/input_validators.dart';
import 'package:wepsys_contact_list/features/core/views/widgets/c_text_field/c_text_field.dart';

class ContactForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;

  const ContactForm({
    required this.formKey,
    required this.nameController,
    required this.lastNameController,
    required this.phoneController,
    Key? key,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  void dispose() {
    widget.nameController.dispose();
    widget.lastNameController.dispose();
    widget.phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CTextFormField(
            controller: widget.nameController,
            hintText: 'Name',
            maxLenght: 40,
            validator: emptyValidator,
          ),
          const SizedBox(height: 20),
          CTextFormField(
            controller: widget.lastNameController,
            hintText: 'Lastname',
            maxLenght: 40,
          ),
          const SizedBox(height: 20),
          CTextFormField(
            controller: widget.phoneController,
            hintText: 'Phone',
            inputFormatters: onlyNumbersInputFormater,
            validator: emptyValidator,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              final newValue = phoneFormatter(value);
              widget.phoneController.value = TextEditingValue(
                text: newValue,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: newValue.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
