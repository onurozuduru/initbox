FROM docker.io/library/ubuntu:22.04

LABEL com.github.containers.toolbox="true" \
    usage="Image for distrobox with init system additions" \
    summary="Development environment with systemd"

ARG PACKAGES="systemd libpam-systemd wget openssh-server git neovim python3-neovim tmux fzf ripgrep"
RUN apt update && \
    apt upgrade -y && \
    apt install -y $PACKAGES

