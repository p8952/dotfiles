test_name 'C3425 - clone (git protocol)'

# Globals
repo_name = 'testrepo_clone'

hosts.each do |host|
  tmpdir = host.tmpdir('vcsrepo')
  step 'setup - create repo' do
    install_package(host, 'git')
    my_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../..'))
    scp_to(host, "#{my_root}/acceptance/files/create_git_repo.sh", tmpdir)
    on(host, "cd #{tmpdir} && ./create_git_repo.sh")
  end
  step 'setup - start git daemon' do
    install_package(host, 'git-daemon')
    on(host, "git daemon --base-path=#{tmpdir}  --export-all --reuseaddr --verbose --detach")
  end

  teardown do
    on(host, "rm -fr #{tmpdir}")
    on(host, 'pkill -9 git-daemon ; sleep 1')
  end

  step 'clone with puppet' do
    pp = <<-EOS
    vcsrepo { "#{tmpdir}/#{repo_name}":
      ensure => present,
      source => "git://#{host}/testrepo.git",
      provider => git,
    }
    EOS

    apply_manifest_on(host, pp, :catch_failures => true)
    apply_manifest_on(host, pp, :catch_changes  => true)
  end

  step "verify checkout is on the master branch" do
    on(host, "ls #{tmpdir}/#{repo_name}/.git/") do |res|
      fail_test('checkout not found') unless res.stdout.include? "HEAD"
    end

    on(host, "cat #{tmpdir}/#{repo_name}/.git/HEAD") do |res|
      fail_test('master not found') unless res.stdout.include? "ref: refs/heads/master"
    end
  end

end
