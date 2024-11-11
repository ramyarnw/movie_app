import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/storage_service_impl.dart';
import 'package:movie_app/views/widgets/textfield_decoration.dart';

import '../../core/storage_service.dart';
import '../../models/storage_model/storage_item.dart';

class SearchKeyValueDialog extends StatefulWidget {
  const SearchKeyValueDialog({super.key});

  @override
  State<SearchKeyValueDialog> createState() => _SearchKeyValueDialogState();
}

class _SearchKeyValueDialogState extends State<SearchKeyValueDialog> {
  final TextEditingController _keyController = TextEditingController();
  final StorageService _storageService = StorageServiceImpl();
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _keyController,
              decoration: textFieldDecoration(hintText: "Enter Key"),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      _value = await _storageService
                          .readSecureData(key: _keyController.text);
                      setState(() {});
                    },
                    child: const Text('Search'))),
            _value == null
                ? const SizedBox()
                : Text(
              'Value: $_value',
            )
          ],
        ),
      ),
    );
  }
}
