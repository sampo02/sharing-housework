import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

abstract class DynamicLinkRemoteDataSource {
  Future<Uri> generateInvitation();
  Future<Uri?> retrieve();
}

class DynamicLinkRemoteDataSourceImpl implements DynamicLinkRemoteDataSource {
  @override
  Future<Uri> generateInvitation() async {
    final parameters = DynamicLinkParameters(
        uriPrefix: 'https://sharinghousework.page.link',
        link: Uri.parse(
            'https://sharinghousework.page.link/invitations?token=token'),
        androidParameters: AndroidParameters(
          packageName: 'com.sampo02.sharingHousework',
          minimumVersion: 0,
        ));
    var dynamicLink = await parameters.buildShortLink();
    return dynamicLink.shortUrl;
  }

  Uri? result;

  Future<void> callBackOnSuccess(Uri? uri) async {
    result = uri;
  }

  @override
  Future<Uri?> retrieve() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data?.link != null) {
      result = data?.link;
    }

    if (result == null) {
      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData? dynamicLink) async {
            final Uri? deepLink = dynamicLink?.link;

            if (deepLink != null) {
              await callBackOnSuccess(deepLink);
            }
          },
          onError: (OnLinkErrorException e) async {});
    }
    return result;
  }
}
