# Actuable Chef Cookbooks

Chef cookbooks to use with Chef solo.

## How to setup a new server in Toldo

### Basic steps

  - login as `root`
  - create `ubuntu` user
  - `usermod -a -G admin ubuntu`
  - test SSH connection using ubuntu user
  - generate a SSH keypair `ssh-keygen`
  - upload SSH public key
  - edit `/etc/ssh/sshd_config`:

        PermitRootLogin no
        PasswordAuthentication no
        ChallengeResponseAuthentication no

  - `service ssh restart`

### Installing the basic system

    curl "https://raw.github.com/ferblape/actuable-cookbooks/master/install.sh" | sh

### Get the cookbooks

    - git clone the repository in /home/ubuntu/.chef
    - `sudo chef-solo -j roles/<role>.json -c solo.rb`

## Author

Fernando Blat <fb@actuable.com>
