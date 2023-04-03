<h1 align="center">Packages</h1>
<div align="center">
    <img width="400" src="./assets/logo.png">
</div>
<p align="center">Private Arch linux package repository</p>

<h2 align="center">Description</h2>

<p align="center">Private Arch linux package repository for use in the Archy flavour installation.</p>

<h2 align="center">Provides</h2>

Provides the following packages:

- yay
- i2p
- emath
- picom
- trizen
- awesome
- jdownloader2
- web-greeter-theme-shikai

<h2 align="center">Usage</h2>

To activate the repository two steps are needed:

- Add the repository key to the pacman keyring.
- Add the repository entry to the pacman configuration file.

They would consist of the following commands:

- `sudo pacman-key --recv-keys 11E855265688AEAE`
- `sudo pacman-key --finger 11E855265688AEAE`
- `sudo pacman-key --lsign-key 11E855265688AEAE`
- `sudo echo '[wisker]
Server =  https://thewisker.github.io/Packages/x86_64' >> /etc/pacman.conf`

<h2 align="center">Author</h2>
<div align="center">
    <img width="200" height="200" src="./assets/profile.png"></img>
</div>
<h4 align="center">TheWisker</h4>