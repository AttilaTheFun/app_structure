"""
Defines a dependency on the buildtools repository.
"""

# load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def buildtools_repository():
    # http_archive(
    #     name = "buildtools",
    #     sha256 = "42968f9134ba2c75c03bb271bd7bb062afb7da449f9b913c96e5be4ce890030a",
    #     strip_prefix = "buildtools-6.3.3",
    #     urls = [
    #         "https://github.com/bazelbuild/buildtools/archive/refs/tags/v6.3.3.tar.gz",
    #     ],
    # )
    git_repository(
        name = "buildtools",
        commit = "e8decc8b15d1f5f1f51db822fbbcb36e863bcf12",
        remote = "https://github.com/bazelbuild/buildtools.git",
    )
