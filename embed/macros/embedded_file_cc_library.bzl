load("@rules_cc//cc:defs.bzl", "cc_import")
load("@dwtj_rules_embed//embed:rules/embedded_file_cc_header/defs.bzl", "embedded_file_cc_header")
load("@dwtj_rules_embed//embed:rules/embedded_file_cc_object/defs.bzl", "embedded_file_cc_object")

def embedded_file_cc_library(
        name,
        file,
        native_symbol_name,
        cc_namespace,
        byte_type = "std::byte",
        visibility = ["//visibility:__pkg__"],
    ):
    embedded_file_cc_header(
        name = name + "_header",
        native_symbol_name = native_symbol_name,
        cc_namespace = cc_namespace,
        output = name + ".h",
    )
    embedded_file_cc_object(
        name = name + "_object",
        file = file,
        native_symbol_name = native_symbol_name,
        output = name + ".a",
    )
    cc_import(
        name = name,
        hdrs = [name + ".h"],
        static_library = name + ".a",
        visibility = visibility,
    )
