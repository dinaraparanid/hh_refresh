import 'package:url_launcher/url_launcher.dart';

final class OpenCVInBrowserUseCase {
  static const _headHunterCVUrl = 'https://hh.ru/applicant/resumes';

  Future<void> execute({
    void Function()? onSuccess,
    required void Function() onFailure,
  }) async {
    final uri = Uri.parse(_headHunterCVUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      onSuccess?.call();
    } else {
      onFailure();
    }
  }
}
