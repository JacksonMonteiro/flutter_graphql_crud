const String getAllUsersQuery = """
query{
  getUsers{
    id
    name
    email
    job_title
  }
}
""";

const String getUserQuery = """
query (\$id: Int){
    getUserInfo(id: \$id) {
      id,
      name,
      job_title,
      email
    }
  }
""";

const createUserMutation = """
mutation(\$name: String, \$email: String, \$job_title: String) {
    createUser (name: \$name, email: \$email, job_title: \$job_title)
  }
""";

const updateUserMutation = """
mutation(\$id: Int, \$name: String, \$email: String, \$job_title: String) {
    updateUserInfo (id: \$id, name: \$name, email: \$email, job_title: \$job_title)
  }
""";

const deleteUSerMutation = """
mutation(\$id: Int) {
    deleteUser(id: \$id)
  }
""";
