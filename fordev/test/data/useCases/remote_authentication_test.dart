import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:faker/faker.dart';

import 'package:fordev/data/http/http.dart';
import 'package:fordev/data/usecases/remote_authentication.dart';

import 'package:fordev/domain/useCases/useCases.dart';


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