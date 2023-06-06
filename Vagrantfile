# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Configuración de la máquina virtual master con Ansible instalado
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/jammy"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.33.10"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM

    end
    master.vm.provision "shell", path: "master.sh"

  end

  # Configuración de la máquina virtual docker con Docker instalado
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/jammy"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.33.20"
    jenkins.vm.provider "virtualbox" do |vb|
      vb.name = "jenkins"
      vb.memory = 2048  # Asigna 2 GB de memoria RAM

    end
    jenkins.vm.provision "shell", path: "jenkins.sh"

  end

  # Configuración de dos máquinas virtuales objetivo
  (1..3).each do |i|
    config.vm.define "slave#{i}" do |slave|
      slave.vm.box = "ubuntu/jammy"
      slave.vm.hostname = "slave#{i}"
      slave.vm.network "private_network", ip: "192.168.33.#{i+20}"
      slave.vm.provider "virtualbox" do |vb|
        vb.name = "slave#{i}"
        vb.memory = 2048  # Asigna 1 GB de memoria RAM

      end
      slave.vm.provision "shell", path: "slave.sh"
    end
  end

end
