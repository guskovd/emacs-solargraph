pkg_name=emacs-solargraph
pkg_origin=guskovd
pkg_version='1.0'
pkg_description="emacs solargraph"
pkg_maintainer='guskovd'
pkg_upstream_url="https://github.com/guskovd/emacs-solargraph"

pkg_hab_shell_interpreter="bash"

RUBY_VERSION=2.5.1

pkg_deps=(
    core/bash
    core/coreutils
    core/gawk
    core/which
    core/hab
    core/grep
    core/sed
    core/sudo
    core/git
    core/ruby/$RUBY_VERSION
    core/tar
    core/rsync
)

do_shell() {
    . ~/.bashrc
    ruby_bundle_path=$HOME/.hab-shell/ruby/bundle/$RUBY_VERSION

    mkdir -p $ruby_bundle_path
    export BUNDLE_PATH=$ruby_bundle_path

    pushd "$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null
    bundle install --binstubs > /dev/null
    popd > /dev/null

    export PATH="$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.hab-shell/bin:$PATH"
    export PATH="$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/bin:$PATH"
}

do_build() {
    return 0
}

do_install() {
    return 0
}

