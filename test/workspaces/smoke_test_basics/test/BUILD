load("@dwtj_rules_embed//embed:defs.bzl", "embedded_file_cc_library")

embedded_file_cc_library(
    name = "test_txt",
    file = ":test.txt",
    native_symbol_name = "test_txt",
    cc_namespace = "test::txt",
)

cc_binary(
    name = "test_binary",
    srcs = ["test.cc"],
    deps = [":test_txt"],
)

sh_test(
    name = "test",
    srcs = ["test.sh"],
    args = [
        "$(location :test_binary)",
        "$(location :test.txt)"
    ],
    data = [
        ":test_binary",
        ":test.txt"
    ],
)
