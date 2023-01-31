import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_crud/app/graphql_strings.dart' as gql_string;

Future<Map<String, dynamic>> getUser({int? id}) async {
  HttpLink link = HttpLink("http://localhost:4000/graphql");

  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore()
    ),
  );

  QueryResult queryResult = await qlClient.query(
    QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql(
        gql_string.getUserQuery
      ),
      variables: {
        "id": id,
      })
  );

  return queryResult.data?['getUserInfo'] ?? {};
}