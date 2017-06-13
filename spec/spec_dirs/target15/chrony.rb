describe ("clock is synchronized external ntp server ") do
  describe file("/etc/chrony.conf") do
    its(:content) { should match /^server 0\.jp\.pool\.ntp\.org iburst$/ }
  end
  describe file("/etc/chrony.conf") do
    its(:content) { should match /^server 1\.jp\.pool\.ntp\.org iburst$/ }
  end
  describe command("chronyc sources") do
    its(:stdout) { should match /^\^\* (?!controller).*$/ }
  end
end

