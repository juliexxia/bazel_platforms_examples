# Example 09: Reading configurations inside rule implementation
This example demonstrates how to access configuration information
by depending on build setting targets

## Commands
```
bazel build //examples/09_config_inside_rule_impl:my_rule 
> Printing from my_rule
> foo_enabled = False

bazel build //examples/09_config_inside_rule_impl:my_rule \
	--//examples/09_config_inside_rule_impl:foo_enabled_flag=True
> Printing from my_rule
> foo_enabled = True
```

## Description
Traditionally, you would need to use the 
[`fragments`](https://docs.bazel.build/versions/master/skylark/rules.html#configuration-fragments)
API to access configuration, but with Starlark-defined build settings
rules can declare regular dependencies on build settings and read their
current values. That means if a build setting was changed at any point
in the build before this rule is analyzed (i.e. on the command line or
by a [configuration
transition](https://docs.bazel.build/versions/0.27.0/skylark/config.html#user-defined-transition))
, the updated value will be read by the rule here.