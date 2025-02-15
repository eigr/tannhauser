DESCRIPTION = "Elixir"
HOMEPAGE = "https://elixir-lang.org"
LICENSE = "Apache-2.0"
DEPENDS = "erlang-native"

SRC_URI = "https://github.com/elixir-lang/elixir/archive/v${PV}.tar.gz"
S = "${WORKDIR}/elixir-${PV}"

inherit mix