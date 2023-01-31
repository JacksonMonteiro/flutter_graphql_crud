import 'package:graphql_crud/app/graphql_strings.dart' as gql_string;
import 'package:graphql_flutter/graphql_flutter.dart';

Future<bool> createUser({String? name, String? email, String? job}) async {
  HttpLink link = HttpLink("http://localhost:4000/graphql");

  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

  QueryResult queryResult = await qlClient.mutate(
    MutationOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          gql_string.createUserMutation,
        ),
        variables: {
          "name": name,
          "email": email,
          "job_title": job,
        }),
  );

  return queryResult.data?['createUser'] ?? false;  
}
