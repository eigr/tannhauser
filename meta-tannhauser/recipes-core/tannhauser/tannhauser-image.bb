SUMMARY = "Tannhauser Minimal Image"
LICENSE = "MIT"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    erlang \
    elixir \
    tannhauser-elixir-app \
    kernel-modules \
"

IMAGE_FEATURES = ""

inherit core-image

# Remove serviços desnecessários (ex: systemd)
NO_RECOMMENDATIONS = "1"