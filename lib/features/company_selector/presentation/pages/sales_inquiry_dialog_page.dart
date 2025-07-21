import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_society.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_state.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SalesInquiryForm extends StatefulWidget {
  const SalesInquiryForm({super.key});

  @override
  State<SalesInquiryForm> createState() => _SalesInquiryFormState();
}

class _SalesInquiryFormState extends State<SalesInquiryForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _companyController = TextEditingController();
  final _employeesController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => InquiryBloc(GetIt.I<RequestSocietyUseCase>()),
    child: BlocConsumer<InquiryBloc, InquiryState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: CustomText(state.message)));
        } else if (state is SuccessState) {
          Navigator.pop(context); // Close the form
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: CustomText(state.message)));
        }
      },
      builder: (context, state) => Stack(
        children: [
          _buildForm(context),
          if (state is LoadingState)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black45,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    ),
  );

  Widget _buildForm(BuildContext context) {
    final bloc = context.read<InquiryBloc>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomText(
                  'Sales Inquiry',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(_nameController, 'Contact Person Name', true),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: DropdownButtonFormField<String>(
                        value: '+91', // default value
                        decoration: const InputDecoration(
                          labelText: 'Country Code',
                          border: OutlineInputBorder(),
                          disabledBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        onChanged: (value) {},
                        items:
                            [
                                  '+91',
                                  '+1',
                                  '+44',
                                  '+61',
                                  '+971',
                                ] // Add more as needed
                                .map(
                                  (code) => DropdownMenuItem(
                                    value: code,
                                    child: CustomText(code),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: _buildTextField(
                      _mobileController,
                      'Mobile Number',
                      true,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              _buildTextField(_companyController, 'Company Name', true),
              _buildTextField(
                _employeesController,
                'Number of Employees',
                true,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                _emailController,
                'Email (optional)',
                false,
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                _addressController,
                'Address (optional)',
                false,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    final RequestSociety requestSociety = RequestSociety(
                      personName: _nameController.text.trim(),
                      personEmail: _emailController.text.trim(),
                      personMobile: _mobileController.text.trim(),
                      countryCode:
                          '+91', //TODO: You can change this to the selected country code
                      address: _addressController.text.trim(),
                      appVersionCode:
                          '1.0.0', //TODO: Replace with actual version
                      companyName: _companyController.text.trim(),
                      noOfEmployees: _employeesController.text.trim(),
                    );
                    if (_formKey.currentState!.validate()) {
                      bloc.add(FormSubmitted(requestSociety));
                    }
                  },
                  child: const CustomText('Submit', color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    bool isRequired, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    Function(String)? onChanged,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12, top: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: isRequired
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label is required';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
      ),
    ),
  );
}
