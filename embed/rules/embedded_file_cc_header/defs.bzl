'''Defines the `cc_embedded_file` rule.
'''

def _embedded_file_cc_header_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._embed_header_template,
        output = ctx.outputs.output,
        substitutions = {
            "{CC_NAMESPACE}": ctx.attr.cc_namespace,
            "{NATIVE_SYMBOL_NAME}": ctx.attr.native_symbol_name,
            "{BYTE_TYPE}": ctx.attr.byte_type,
            "{HEADER_GUARD_DEF_NAME}": ctx.attr.native_symbol_name + "_H_",
        },
        is_executable = False,
    )

embedded_file_cc_header = rule(
    implementation = _embedded_file_cc_header_impl,
    attrs = {
        "cc_namespace": attr.string(
            # TODO(dwtj): Make this optional and make the default value inferred
            #  from context. (e.g. package & target name)
            mandatory = True,
        ),
        "native_symbol_name": attr.string(
            # TODO(dwtj): Make this optional and make the default value inferred
            #  from context (e.g. package & target name).
            mandatory = True,
        ),
        "byte_type": attr.string(
            # TODO(dwtj): Consider supporting additional values.
            values = ["std::byte", "char"],
            default = "std::byte",
        ),
        "output": attr.output(
            # TODO(dwtj): Make this optional.
            mandatory= True,
        ),
        "_embed_header_template": attr.label(
            allow_single_file = True,
            default = "//embed:rules/embedded_file_cc_header/TEMPLATE.embed.h"
        ),
    },
)
