FROM docker.io/library/ubuntu:22.04

LABEL com.github.containers.toolbox="true" \
    usage="Image for distrobox with init system additions" \
    summary="Development environment with systemd"

ARG PACKAGES="systemd libpam-systemd wget openssh-server git git-lfs neovim python3-neovim tmux ripgrep curl exa xsel"
RUN apt update && \
    apt upgrade -y && \
    apt install -y $PACKAGES && \
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin && \
    mkdir -p /tmux/plugins && \
    chown 1000:1000 -R /tmux

USER 1000
RUN export TMUX_PLUGIN_MANAGER_PATH="/tmux/plugins" && \
    git clone https://github.com/tmux-plugins/tpm /tmux/plugins/tpm && \
    /bin/bash /tmux/plugins/tpm/scripts/install_plugins.sh


