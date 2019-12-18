cc_library(
    name = "hellolib",
    srcs = [
        "a.c",
        "b.c"
    ],
)

cc_binary(
    name = "hello",
    srcs = [
        "hello.c"
    ],
    deps = [":hellolib"],
)

genrule(
    name = "coverity_gatherer",
    srcs = [":hello"],
    outs = ["gatherer.all"],
    cmd = "find . -iname '*.tu' > $@",
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
        "$(ACTION_ID).tu",
    ],
    cmd = "$(location :coverity_wrapper) " +
        "$(EXTRA_ACTION_FILE) " +
        "$(output $(ACTION_ID).tu) ",
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
