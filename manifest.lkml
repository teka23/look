project_name: "thelook"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
visualization: {
  id: "MyMultipleValue"
  label: "MyMultipleValue"
  file: "viz/multiplevalue.js"
}

local_dependency: {
  project: "mtr_fernando_valenzuela_testing"
}

remote_dependency: chris_test_git {
  url: "git@github.com:Kruncha/test_create_project.git"
  ref: "master"
}
