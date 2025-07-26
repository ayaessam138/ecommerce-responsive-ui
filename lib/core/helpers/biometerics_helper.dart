import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  static final LocalAuthentication _auth = LocalAuthentication();
  //to checkDevice Support BioMetrics or not even ios or android
  static Future<bool> isBiometricSupported() async {
    return await _auth.isDeviceSupported();
  }

  // to get the BiometricTypes the user registered in his phone
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _auth.getAvailableBiometrics();
  }

  // to authenticate the registered Biometric
  static Future<bool> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }
}
