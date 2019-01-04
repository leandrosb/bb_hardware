VAGRANT_VM_PROVIDER = "virtualbox"

Vagrant.configure("2") do |config|


  config.vm.define "desenv" do |desenv|
    desenv.vm.box = "centos/7"
    desenv.vm.hostname = "development"
    desenv.vm.network :private_network, ip: "192.168.10.2"
    #desenv.vm.provision "file", source: "/Users/mac/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/me.pub"
    #desenv.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"
    desenv.vm.provision "shell", inline: "yum update  -y"

    desenv.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1","on" ]
      v.customize ["modifyvm", :id, "--memory", 128]
      v.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

end
