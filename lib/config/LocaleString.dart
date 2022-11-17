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
          'login_out': 'Login out',
          'login_in': 'Login in',
          'save_my_phone': 'Save my phone number'
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
          'logout': 'Se déconnecter',
          'login_in': 'Se connecter',
          'save_my_phone': 'Enregistrer mon numéro de téléphone'
        }
      };
}
