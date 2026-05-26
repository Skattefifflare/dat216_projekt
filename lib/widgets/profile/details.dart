import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/profile/profile_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _FieldDivider extends StatelessWidget {
  const _FieldDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 250,
      child: Divider(thickness: AppTheme.strokeTiny, color: theme.secondary),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ProfileFieldState> _nameFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _phoneFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _emailFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _passwordFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _cardNumberFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _expiryFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _cvcFieldKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _adressKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _adressnumberKey =
      GlobalKey<ProfileFieldState>();
  final GlobalKey<ProfileFieldState> _postadressKey =
      GlobalKey<ProfileFieldState>();

  bool _isEditing = false;

  void _enableEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveUpdates() {
    _nameFieldKey.currentState?.save();
    _phoneFieldKey.currentState?.save();
    _emailFieldKey.currentState?.save();
    _passwordFieldKey.currentState?.save();
    _cardNumberFieldKey.currentState?.save();
    _expiryFieldKey.currentState?.save();
    _cvcFieldKey.currentState?.save();
    _adressKey.currentState?.save();
    _adressnumberKey.currentState?.save();
    _postadressKey.currentState?.save();

    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final handler = context.read<ImatDataHandler>();
    final customer = handler.getCustomer();
    final user = handler.getUser();
    final creditCard = handler.getCreditCard();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Card(
        color: theme.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          side: BorderSide(color: theme.primary, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 250,
                        child: Row(
                          children: [
                            Icon(Icons.person, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Personuppgifter',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _nameFieldKey,
                        label: 'Namn',
                        hintTxt: 'T.ex Hjördis Efternamnsson',
                        intitialVal:
                            '${customer.firstName} ${customer.lastName}',
                        enabled: _isEditing,
                        onSave: (String value) {
                          final parts = value.split(' ');
                          if (parts.isNotEmpty) {
                            customer.firstName = parts.first;
                            customer.lastName = parts.length > 1
                                ? parts.sublist(1).join(' ')
                                : '';
                          }
                          handler.setCustomer(customer);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _phoneFieldKey,
                        label: 'Telefonnummer',
                        hintTxt: 'T.ex +46 999 999 99 99',
                        intitialVal: customer.phoneNumber,
                        enabled: _isEditing,
                        onSave: (String value) {
                          customer.phoneNumber = value;
                          handler.setCustomer(customer);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _emailFieldKey,
                        label: 'E-post',
                        hintTxt: 'T.ex example@gmail.com',
                        intitialVal: customer.email,
                        enabled: _isEditing,
                        onSave: (String value) {
                          customer.email = value;
                          handler.setCustomer(customer);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _passwordFieldKey,
                        label: 'Lösenord',
                        hintTxt: '******',
                        intitialVal: user.password,
                        obscureText: true,
                        enabled: _isEditing,
                        onSave: (String value) {
                          user.password = value;
                          handler.setUser(user);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: AppTheme.paddingLarge),
                  Container(
                    width: AppTheme.strokeSmall,
                    color: theme.secondary,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingMedium,
                    ),
                    height: 410,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 250,
                        child: Row(
                          children: [
                            Icon(Icons.credit_card, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Kortuppgifter',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _cardNumberFieldKey,
                        label: 'Kortnummer',
                        hintTxt: 'T.ex 9999 9999 9999 9999',
                        intitialVal: creditCard.cardNumber,
                        enabled: _isEditing,
                        onSave: (String value) {
                          creditCard.cardNumber = value;
                          handler.setCreditCard(creditCard);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _expiryFieldKey,
                        label: 'Utgångsdatum',
                        hintTxt: 'T.ex 12/34',
                        intitialVal:
                            '${creditCard.validMonth}/${creditCard.validYear}',
                        enabled: _isEditing,
                        onSave: (String value) {
                          final parts = value.split('/');
                          if (parts.length >= 2) {
                            creditCard.validMonth =
                                int.tryParse(parts[0]) ?? creditCard.validMonth;
                            creditCard.validYear =
                                int.tryParse(parts[1]) ?? creditCard.validYear;
                          }
                          handler.setCreditCard(creditCard);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _cvcFieldKey,
                        label: 'CVC',
                        hintTxt: 'T.ex 420',
                        intitialVal: creditCard.verificationCode.toString(),
                        enabled: _isEditing,
                        onSave: (String value) {
                          creditCard.verificationCode =
                              int.tryParse(value) ??
                              creditCard.verificationCode;
                          handler.setCreditCard(creditCard);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: AppTheme.paddingLarge),
                  Container(
                    width: AppTheme.strokeSmall,
                    color: theme.secondary,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingMedium,
                    ),
                    height: 410,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 250,
                        child: Row(
                          children: [
                            Icon(Icons.home, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Adressuppgifter',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _adressKey,
                        label: 'Adress',
                        hintTxt: 'T.ex ogatan 1',
                        intitialVal: customer.address,
                        enabled: _isEditing,
                        onSave: (String value) {
                          customer.address = value;
                          handler.setCustomer(customer);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _adressnumberKey,
                        label: 'Postnummer',
                        hintTxt: 'T.ex 999 99',
                        intitialVal: customer.postCode,
                        enabled: _isEditing,
                        onSave: (String value) {
                          customer.postCode = value;
                          handler.setCustomer(customer);
                        },
                      ),
                      const _FieldDivider(),
                      ProfileField(
                        key: _postadressKey,
                        label: 'Postadress',
                        hintTxt:
                            'T.ex Hjördis Efternamnsson, ogatan 1, 421 31 Göteborg',
                        intitialVal: customer.postAddress,
                        enabled: _isEditing,
                        onSave: (String value) {
                          customer.postAddress = value;
                          handler.setCustomer(customer);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.paddingLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.secondary,
                      foregroundColor: theme.onSecondary,
                    ),
                    onPressed: _isEditing ? null : _enableEditing,
                    child: const Text('Ändra uppgifter'),
                  ),
                  const SizedBox(width: AppTheme.paddingMedium),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.secondary,
                      foregroundColor: theme.onSecondary,
                    ),
                    onPressed: _isEditing ? _saveUpdates : null,
                    child: const Text('Spara uppgifter'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
