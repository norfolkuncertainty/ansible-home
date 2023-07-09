# ansible-home
Create a site.yml based off the site.example.yaml

## Running locally
ansible-playbook -l <local node name> site.yml -c local

## Running remotely
ansible-playbook -l <remote node name> site.yml -K

## Running proxmox role

ansible-playbook site.yml -l localhost --tags proxmox -c local --ask-vault-pass

## Adding Dave
./dave.yaml --extra-vars "hostname=<hostname>" -Kk

## Basic VM build

- Confirm network
- Partition and format disks, then mount
- `pacstrap -K /mnt base linux linux-firmware openssh grub vim python`
- `genfstab -U /mnt >> /mnt/etc/fstab`
- `arch-chroot /mnt`
- `echo $HOSTNAME > /etc/hostname`
- Set root password
- `grub-install --target=i386-pc /dev/vda`
- `grub-mkconfig -o /boot/grub/grub.cfg`
- `systemctl enable sshd`
- `echo "PermitRootLogin yes" >> /etc/ssh/sshd_config`
- setup network
  - ```
    #/etc/systemd/network/20-wired.network
    [Match]
    Name=ens18
  
    [Network]
    DHCP=yes
    ```
  - `systemctl enable systemd-networkd`
  - `systemctl enable systemd-resolved`
- Reboot
- Make DHCP lease static
- Add servername to internal DNS and spreadsheet
- Add server to site.yml with profile
- Add user via playbook
- Run ansible playbook