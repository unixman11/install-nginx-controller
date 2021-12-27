$script = <<-SCRIPT
sudo echo "192.168.55.113 controller.example.com" >> /etc/hosts
export CTR_SMTP_HOST=localhost && export CTR_SMTP_PORT=25 && export CTR_SMTP_AUTH=false && export CTR_SMTP_TLS=false && export CTR_SMTP_FROM=unixman11@gmail.com && export CTR_FQDN=controller.example.com && export CTR_FIRSTNAME=Example && export CTR_LASTNAME=NaJa && export CTR_EMAIL=admin@example && export CTR_PASSWORD=P@ssw0rd
tar xzf controller-installer-3.18.2.tar.gz
cd controller-installer
./helper.sh prereqs
./install.sh --tsdb-volume-type local --self-signed-cert --non-interactive --accept-license
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define "nginx-controller" do |vm1|
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.hostname = "nginx-controller"
    vm1.vm.network "private_network", ip: "192.168.55.113"
    #vm1.vm.provision "shell", path: "install-K8s.sh"
    vm1.vm.provision "file", source: "controller-installer-3.18.2.tar.gz", destination: "~/controller-installer-3.18.2.tar.gz"
    vm1.disksize.size = '255GB'
    vm1.vm.provision "shell", inline: $script
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "nginx-controller"
      vb.cpus = 8
      vb.memory = 8192
      #vb.customize ["modifyvm", :id, "--nic1", "natnetwork"]
      #vb.customize ["modifyvm", :id, "--nat-network1", "NatNetwork"]
    end
  end

end
