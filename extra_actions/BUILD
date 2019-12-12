cc_binary(
    name = "hello",
    copts = ["--coverage"],
    linkopts = ["--coverage"],
    srcs = ["hello.c"],
)

action_listener(
    name = "coverity_listener",
    mnemonics = [
        "CppCompile",
    ],
    extra_actions = [":coverity"],
    visibility = ["//visibility:public"],
)

extra_action(
    name = "coverity",
    tools = [
        ":coverity_wrapper",
    ],
    out_templates = [
        "$(ACTION_ID)_compile_command",
    ],
    cmd = "$(location :coverity_wrapper) " +
        "$(EXTRA_ACTION_FILE) " +
        "$(output $(ACTION_ID)_compile_command) ",
)

py_binary(
    name = "coverity_wrapper",
    srcs = [
        "coverity_wrapper.py",
    ],
    deps = [
        "//third_party/bazel:extra_actions_base_pb2",
    ],
)
