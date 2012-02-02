# Actuable Chef Cookbooks

Chef cookbooks to use with Chef solo.

## How to setup a new server in Actuable

  - login as `root`
  - `curl "https://github.com/ferblape/actuable-cookbooks/raw/master/install.sh" | sh`
  - `cd /user/local`
  - `git clone git@github.com:ferblape/actuable-cookbooks.git`
  - `sudo chef-solo -j roles/<role>.json -c solo.rb`

## Author

Fernando Blat <fb@actuable.com>
