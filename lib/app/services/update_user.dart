import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_crud/app/graphql_strings.dart' as gql_string;

Future<bool> updateUser(
    {String? id, String? name, String? email, String? job}) async {
  HttpLink link = HttpLink("http://localhost:4000/graphql");

  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore()
    ),
  );

  QueryResult queryResult = await qlClient.mutate(
    MutationOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql(
        gql_string.updateUserMutation,        
      ),
      variables: {
        "id": int.tryParse(id ?? ''),
        "name": name,
        "email": email, 
        "job_title": job,
      })
  );

  return queryResult.data?['updateUserInfo'] ?? false;
}
