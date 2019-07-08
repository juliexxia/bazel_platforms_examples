load("@bazel_skylib//rules:common_settings.bzl", "bool_flag")
load("//examples/09_config_inside_rule_impl:defs.bzl", "my_rule")

bool_flag(
    name = "foo_enabled_flag",
    build_setting_default = False,
)

my_rule(name = "my_rule",)