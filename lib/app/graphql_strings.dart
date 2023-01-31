const createUserMutation = """
  mutation(\$name: String, \$email: String, \$job_title: String) {
    createUser (name: \$name, email: \$email, job_title: \$job_title)
  }
""";