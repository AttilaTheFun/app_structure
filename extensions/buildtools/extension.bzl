"""
Defines a module extension for the buildtools repository.
"""

load("//extensions/buildtools:repository.bzl", "buildtools_repository")

def _buildtools_extension_impl(_ctx):
    buildtools_repository()

buildtools_extension = module_extension(
    implementation = _buildtools_extension_impl,
)
