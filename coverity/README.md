# build with listener

bazel build //:hello --experimental_action_listener=//:coverity_listener --host_force_python=PY2 -s

# build with aspect

bazel build //:hello --experimental_action_listener=//:coverity_listener --host_force_python=PY2 -s --aspects aspect.bzl%print_aspect
