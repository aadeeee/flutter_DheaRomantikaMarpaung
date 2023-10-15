import 'package:api_key/env/env.dart';
import 'package:intl/intl.dart';

String apiKey = Env.apiKey;

final formatCurrency = NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0
      );