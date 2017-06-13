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

describe ("openstack necessary packages are installed") do
  packages = ["python-openstackclient", "openstack-selinux"]
  packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end

