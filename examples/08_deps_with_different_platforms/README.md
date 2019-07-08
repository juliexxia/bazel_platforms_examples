# Example 08: Building deps on different platforms
This example demonstrates how to build dependencies of a rule for a 
different platform from the rule itself. 

## Commands
```
bazel build //examples/08_deps_with_different_platforms:my_rule
> Running implementation fxn of dep
> platform from config: //:linux_platform
> Running implementation fxn of my_rule
> platform from config: @local_config_platform//:host

bazel build //examples/08_deps_with_different_platforms:my_rule --platforms=//:windows_platform
> Running implementation fxn of dep
> platform from config: //:linux_platform
> Running implementation fxn of my_rule
> platform from config: //:windows_platform

```

## Description
Sometimes you want to write a rule that can build its
dependencies for different platforms. Instead of two 
seperate Bazel builds, you can specify building 
dependencies with a different configuration using 
Starlark [transitions](https://docs.bazel.build/versions/0.27.0/skylark/config.html#user-defined-transitions).

While starlark transitions are designed to transition on [build 
settings](https://docs.bazel.build/versions/0.27.0/skylark/config.html#user-defined-build-settings) 
(see example 07), this example shows how they can also work on native options.

Since starlark transitions create new configured targets, they have the
potential to exponentially grow your configured target graph size. They have
a built in whitelisting mechanism controlled by the mandatory `_whitelist_function_transition`
attribute. If you'd like to control your own whitelist for your project, you can create one
at the location `//tools/whitelists/function_transition_whitelist` in your project. Otherwise,
you can set the attribute to the all-encompassing list at `@bazel_tools//tools/whitelists/function_transition_whitelist` (as seen in the example).