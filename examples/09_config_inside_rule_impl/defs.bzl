load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")

def _impl(ctx):
    print("Printing from " + ctx.attr.name)
    print("_foo_enabled = " + str(ctx.attr._foo_enabled[BuildSettingInfo].value))
    return []

my_rule = rule(
    implementation = _impl,
    attrs = {
        "_foo_enabled": attr.label(default = Label("//examples/09_config_inside_rule_impl:foo_enabled_flag"))
    }
)