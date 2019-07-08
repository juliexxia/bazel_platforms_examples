
def _transition_impl(settings, attr):
  return {"//command_line_option:platforms": [Label("//:linux_platform")]}

windows_transition = transition(
    implementation = _transition_impl,
    inputs = [],
    outputs = ["//command_line_option:platforms"],
 )

def _impl(ctx):
    print("Running implementation fxn of " + ctx.attr.name)
    platform_data = ctx.fragments.platform
    print("platform from config: " + str(platform_data.platform))
    return []

my_rule = rule(
    implementation = _impl,
    attrs = {
    	# this build the 'dep' attr with the windows platform
    	"dep" : attr.label(cfg = windows_transition),
    	"_whitelist_function_transition": 
    		attr.label(default = "@bazel_tools//tools/whitelists/function_transition_whitelist"),
    },
	fragments = ["platform"]
)
