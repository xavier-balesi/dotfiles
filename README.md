# Dotfiles

## How to

### Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "xavier.balesi@protonmail.ch"
```

### Download and launch installation script

```bash
curl -s https://raw.githubusercontent.com/xavier-balesi/dotfiles/main/install.sh | bash
cd ~/config/dotfiles
ansible-playbook playbooks/install.yaml --ask-become-pass
```

### Configure LightDM

```bash
sudo dpkg-reconfigure lightdm
```
