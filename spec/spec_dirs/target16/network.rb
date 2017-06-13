describe ("hostname is compute") do
  describe command("uname -n") do
    its(:stdout) { should match /^compute$/ }
  end
end

