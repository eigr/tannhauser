DESCRIPTION = "Erlang/OTP"
HOMEPAGE = "https://www.erlang.org"
LICENSE = "Apache-2.0"

SRC_URI = "https://github.com/erlang/otp/archive/OTP-${PV}.tar.gz"
S = "${WORKDIR}/otp-OTP-${PV}"

inherit autotools-brokensep