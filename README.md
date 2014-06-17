# Dotfiles

Apply:
    
	puppet module install puppetlabs-vcsrepo --force
    puppet apply --modulepath ./modules manifests/site.pp
