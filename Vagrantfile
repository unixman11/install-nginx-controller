$script = <<-SCRIPT
sudo echo "192.168.55.113 controller.example.com" >> /etc/hosts
SCRIPT

Vagrant.configure("2") do |config|

  # machine
  config.vm.define "nginx-controller" do |vm1|
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.hostname = "nginx-controller"
    vm1.vm.network "private_network", ip: "192.168.55.113"
    vm1.disksize.size = '255GB'
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "nginx-controller"
      vb.cpus = 8
      vb.memory = 8192
    end
  end
  
  # provision
  config.vm.provision "file", source: "controller-installer-3.18.2.tar.gz", destination: "/tmp/controller-installer-3.18.2.tar.gz"
  config.vm.provision "shell", inline: $script
  config.vm.provision :shell, privileged: false, path: "install-nginx-controller.sh"

end
