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
          'theme': 'Theme',
          'light_mode': 'Light mode',
          'dark_mode': 'Dark mode',
          'lang': 'Language',
          'refresh': 'Refresh',
          'setting': 'Setting',
        },
        'fr_FR': {
          'confirm': 'Confirmer',
          'http_error_title': 'Erreur',
          'http_error': 'Oh! Il y a une erreur.',
          'no_data': 'Aucune donnée',
          'new_letter': 'Nouvelle lettre!',
          'mailbox': 'Boîte aux lettres',
          'theme': 'Thème',
          'light_mode': 'Le thème clair',
          'dark_mode': 'Le thème sombre',
          'lang': 'Langue',
          'refresh': 'Mise à jour',
          'setting': 'Réglages',
        }
      };
}
