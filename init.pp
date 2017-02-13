class vim_puppet(
$show_lint_warning     = true,
$disable_puppetlint    = false,
$disable_puppet_parser = false,
$vimrc_url             = 'https://github.com/ricciocri/vimrc.git',
$exec_path             = [ '/usr/local/bin/', '/bin/', '/usr/bin' ],
$misc_packages         = ['vim','curl','tar','git'],
){

# Validate parameters
validate_bool($show_lint_warning)
validate_bool($disable_puppetlint)
validate_bool($disable_puppet_parser)
validate_string($vimrc_url)
validate_array($exec_path)
validate_array($misc_packages)
# setup and configure vim plugin and packages install
include vim_puppet::install

}

#
class accounts {

  @accounts::virtual { 'monitor':
    uid             =>  1001,
    realname        =>  'monitor',
    pass            =>  '<password hash goes here>',
  }
}