################
# User setup
################

# Create new user with sudo privileges
sudo adduser --disabled-password --gecos "" $NONROOT_USERNAME
sudo usermod -aG sudo $NONROOT_USERNAME
echo "$NONROOT_USERNAME:$NONROOT_PASSWORD" | sudo chpasswd

# Set zsh as default shell
sudo chsh -s `which zsh` $NONROOT_USERNAME

# Oh my zsh for subuser
installOhMyZSH $NONROOT_USERNAME

# Deny user SSH access
echo "DenyUsers $username" >> /etc/ssh/sshd_config