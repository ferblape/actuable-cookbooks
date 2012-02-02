# Actuable Chef Cookbooks

Chef cookbooks to use with Chef solo.

## How to setup a new server in Actuable

  - login as `root`
  - `cd /tmp`
  - `curl https://raw.github.com/ferblape/actuable-cookbooks/master/install.sh | sh`
  - generate ssh keys and configure git repository
  - `git clone git@github.com:ferblape/actuable-cookbooks.git`
  - `sudo chef-solo -j roles/<role>.json -c solo.rb`

## Author

Fernando Blat <fb@actuable.com>
