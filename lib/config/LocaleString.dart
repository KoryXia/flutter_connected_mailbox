import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'confirm': 'Confirm',
          'http_error_title': 'Error',
          'http_error': 'Oh! There is a error.',
          'no_data': 'No data',
          'new_letter': 'New letter!',
          'mailbox': 'Mailbox',
          'lang': 'Language',
          'refresh': 'Refresh',
          'setting': 'Setting',
          'logout': 'Log out',
        },
        'fr_FR': {
          'confirm': 'Confirmer',
          'http_error_title': 'Erreur',
          'http_error': 'Oh! Il y a une erreur.',
          'no_data': 'Aucune donnée',
          'new_letter': 'Nouvelle lettre!',
          'mailbox': 'Boîte aux lettres',
          'lang': 'Langue',
          'refresh': 'Mise à jour',
          'setting': 'Réglages',
          'logout': 'Se déconnecter'
        }
      };
}
