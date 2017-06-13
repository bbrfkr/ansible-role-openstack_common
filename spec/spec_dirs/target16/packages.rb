describe ("No updatable packagess are found") do
  describe command("yum update --assumeno") do
    its(:stdout) { should_not match /^No packages marked for update$/ }
  end
end

