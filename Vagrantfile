default_box = 'generic/debian12'
timeout = 1200
nodes = [
  { :hostname => 'virt-debian', :ip => '10.10.0.10', :box => 'generic/fedora39', :ram => 512, :cpus => 1 },
  { :hostname => 'virt-fedora',  :ip => '10.10.0.20', :box => 'generic/debian12', :ram => 512, :cpus => 1 }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.boot_timeout = timeout
      nodeconfig.vm.box = node[:box] ? node[:box] : default_box
      nodeconfig.vm.hostname = node[:hostname] + ".sv.easy"
      nodeconfig.vm.network :private_network, ip: node[:ip]
      nodeconfig.vm.provider :libvirt do |vb|
        vb.memory = node[:ram]
        vb.cpus = node[:cpus]
      end
      memory = node[:ram]
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.name = node[:hostname]
        vb.linked_clone = true
        vb.memory = node[:ram]
        vb.cpus = node[:cpus]
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", memory.to_s,
        ]
      end
      nodeconfig.vm.provision :shell, inline: <<-SHELL
        fi_username=vagrant
        fi_password=vagrant
        echo 'initializing...'
        sleep 5
        echo 'Setting default password...'
        usermod --password $(echo $fi_password | openssl passwd -1 -stdin) $fi_username
        echo 'enabling password auth ...'
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        echo "Restarting ssh service.."
        systemctl restart sshd
        rm -rf /tmp/*
      SHELL
    end
  end
end
