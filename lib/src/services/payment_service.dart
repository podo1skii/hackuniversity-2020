
import 'package:stripe_payment/stripe_payment.dart';


class PaymentService {
  Future<void> makePayment(double count) async {
    StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        total_price: count.toString(),
        currency_code: "EUR",
      ),
      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'DE',
        currencyCode: 'EUR',
        items: [
          ApplePayItem(
            label: 'Test',
            amount: 'count.toString()',
          )
        ],
      ),
    );
  }
}
