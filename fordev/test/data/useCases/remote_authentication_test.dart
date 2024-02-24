import 'package:fordev/domain/useCases/authentication.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:faker/faker.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void>? auth(AuthenticationParams params) async {
    final Map body = {'email': params.email, 'password': params.password};
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void>? request({required String url, required String method, Map body});
}

class HttpClientSpy extends Mock implements HttpClient {}


void main() {
  late RemoteAuthentication sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct method',  () async {
    final authenticationParams = AuthenticationParams(email: faker.internet.email(), password: faker.internet.password());

    await sut.auth(authenticationParams);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': authenticationParams.email, 'password': authenticationParams.password}
    ));
  });
}