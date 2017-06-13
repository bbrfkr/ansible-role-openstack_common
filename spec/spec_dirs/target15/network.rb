describe ("firewalld is disabled") do
  describe service("firewalld") do
    it { should_not be_running }
    it { should_not be_enabled }
  end
end

describe ("hostname is 'controller'") do
  describe command("uname -n") do
    its(:stdout) { should match /^controller$/ }
  end
end

describe ("host 'controller' is resolvable by hosts") do
  describe host("controller") do
    it { should be_resolvable.by("host") }
  end
end

describe ("host 'compute' is resolvable by hosts") do
  describe host("compute") do
    it { should be_resolvable.by("host") }
  end
end

