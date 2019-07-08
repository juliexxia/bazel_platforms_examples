# Example 08: Select on build settings

Like examples 03 (select on constraint) and 04 (select on platform), this
example demonstrates how to affect a build target via configuration. 

## Commands

```
bazel build //examples/08_using_build_setting:a

>   yolo_library(
>     name = 'a',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )

bazel build //examples/08_using_build_setting:a --//examples/08_using_build_setting:foo_enabled

>   yolo_library(
>     name = 'a',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )
>   yolo_library(
>     name = 'only_with_foo',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )

bazel build //examples/08_using_build_setting:a --//examples/08_using_build_setting:foo_enabled=0

>   yolo_library(
>     name = 'a',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )

bazel build //examples/08_using_build_setting:a --//examples/08_using_build_setting:foo_enabled=1

>   yolo_library(
>     name = 'a',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )
>   yolo_library(
>     name = 'only_with_foo',
>     toolchain = {
>       'targetting_cpu': 'host',
>       'targetting_os': 'host',
>       'executing_on_cpu': 'host',
>       'executing_on_os': 'host',
>     },
>   )
```

## Description

Here we show how to use Bazel's [Starlark build settings](https://docs.bazel.build/versions/master/skylark/config.html) to
trigger different build variations. Build settings are pieces of configuration
that are defined and instantiated in Starlark as targets. They are integrated
with [`select`](https://docs.bazel.build/versions/master/skylark/config.html#build-settings-and-select) as seen here, and can also be accessed in other [rule implementation
functions](https://docs.bazel.build/versions/master/skylark/config.html#depending-on-build-settings) and during [configuration transitions](https://docs.bazel.build/versions/master/skylark/config.html#defining-transitions-in-starlark).

Since we only need a simple build setting in this example, we use the standard `bool`-typed
build setting defined in [Skylib's
common_settings.bzl](https://github.com/bazelbuild/bazel-skylib/blob/master/rules/common_settings.bzl).
We highly recommend using these standard definitions in your project unless you need something more
complicated, like [a more complexly-typed build
setting](https://docs.bazel.build/versions/master/skylark/config.html#using-ctxbuild_setting_value)
build setting]() 
