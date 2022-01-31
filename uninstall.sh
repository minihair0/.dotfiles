sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
sudo rm /etc/synthetic.conf
sudo launchctl unload /Library/LaunchDaemon/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl unload /Library/LaunchDaemons/org.nixos.activate-system.plist
sudo rm /Library/LaunchDaemons/org.nixos.activate-system.plist
sudo rm -rf /etc/nix \
			/var/root/.nix-profile \
			/var/root/.nix-defexpr \
			/var/root/.nix-channels \
			~/.nix-profile \
			~/.nix-defexpr \
			~/.nix-channels
sudo dscl . delete /Groups/nixbld
for i in $(seq 1 32); do sudo dscl . -delete /Users/_nixbld$i; done


sudo diskutil apfs deleteVolume /nix
sudo rm -rf /nix/

sudo chsh -s /bin/zsh $USER

echo '1. remove last line of /etc/shells'
echo '2. edit /etc/shells'
echo '3. disk util.app to clear NIX volume'

