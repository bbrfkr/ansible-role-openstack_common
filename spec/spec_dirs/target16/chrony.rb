describe ("clock is synchronized with controller") do
  describe command("chronyc sources") do
    its(:stdout) { should match /^\^\* controller .*$/ }
  end
end

