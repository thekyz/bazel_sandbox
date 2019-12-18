def _print_aspect_impl(target, ctx):
    # Make sure the rule has a srcs attribute.

    for f in target.files.to_list():
        print(f)
    for attr in dir(ctx.rule):
        print(attr)
    return []

print_aspect = aspect(
    implementation = _print_aspect_impl,
    attr_aspects = ['deps'],
)
