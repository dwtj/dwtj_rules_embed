def _declare_build_script(ctx):
    return ctx.actions.declare_file(ctx.attr.name + ".build_object_file.sh")

def _embedded_file_cc_object_impl(ctx):
    build_script = _declare_build_script(ctx)
    ctx.actions.expand_template(
        template = ctx.file._build_object_file_template,
        output = build_script,
        substitutions = {
            "{NATIVE_SYMBOL_NAME}": ctx.attr.native_symbol_name,
            "{INPUT_FILE_PATH}": ctx.file.file.path,
            "{OUTPUT_FILE_PATH}": ctx.outputs.output.path,
        },
        is_executable = True,
    )

    ctx.actions.run(
        outputs = [ctx.outputs.output],
        inputs = [ctx.file.file],
        executable = build_script,
        mnemonic = "BuildEmbeddedFileCcObject",
        progress_message = "Building native object file with an embedded file for label `{}`".format(ctx.label),
        use_default_shell_env = False,
    )


embedded_file_cc_object = rule(
    implementation = _embedded_file_cc_object_impl,
    attrs = {
        "file": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "native_symbol_name": attr.string(
            # TODO(dwtj): Make this optional and make the default value inferred
            #  from context. (e.g. package & target name)
            mandatory = True,
        ),
        "output": attr.output(
            # TODO(dwtj): Make this optional. Name the output file `<name>.h`
            #  and put it in the same package as this target.
            mandatory = True,
        ),
        "_build_object_file_template": attr.label(
            allow_single_file = True,
            default = "//embed:rules/embedded_file_cc_object/TEMPLATE.build_object_file.sh"
        )
    }
)
