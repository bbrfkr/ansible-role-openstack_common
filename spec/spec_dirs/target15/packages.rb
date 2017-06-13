describe ("openstack ocata repository is registered") do
  describe package("centos-release-openstack-ocata") do
    it { should be_installed }
  end
end

describe ("No updatable packagess are found") do
  describe command("yum update --assumeno") do
    its(:stdout) { should match /^No packages marked for update$/ }
  end
end

describe ("openstack client package is installed") do
  describe package("python-openstackclient") do
    it { should be_installed }
  end
end

describe ("openstack-selinux package is installed") do
  describe package("openstack-selinux") do
    it { should be_installed }
  end
end

