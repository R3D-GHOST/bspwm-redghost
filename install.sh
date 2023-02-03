#!/bin/bash
echo "Instalacion de BSPWM "
sudo apt update

#Instalacion de elementos necesrios
mkdir repos
#BSPWM
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libuv1.dev
cd ~/repos
git clone https://github.com/baskerville/bspwm.git
#Instalacion de bspwm 
cd bspwm
make
sudo make install
sleep 1
#Copiar bspwmrc a la carpeta bspwm
mkdir ~/.config/bspwm
cp examples/bspwmrc ~/.config/bspwm
chmod +x ~/.config/bspwm/bspwmrc
cd ..
#Instalcion de sxhkd  cd sxhkd
git clone https://github.com/baskerville/sxhkd.git
cd sxhkd
make
sudo make install
#Creando Atajos de teclado predeterminados
mkdir ~/.config/sxhkd
cp ../bspwm/examples/sxhkdrc ~/.config/sxhkd
cd ..
#Instalacion de la polybar 
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
cd ..
cd ..
#Instalcion de picom
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd ..
#Instalcion de Rofi
sudo apt install bison flex libstartup-notification0-dev check autotools-dev libpango1.0-dev librsvg2-bin librsvg2-dev libcairo2-dev libglib2.0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
#Instalacion de cosas adicionales
sudo apt install bspwm
sudo apt install sxhkd
sudo apt install polybar
sudo apt install rofi
sudo apt install kitty
sudo apt install i3lock
#Aplicar Fondo de pantalla
echo 'feh --bg-fill $HOME/.Wallpaper/fondo.png' >> ~/.config/bspwm/bspwmrc
sudo apt install feh
echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc
#Instalcion de Powerlevel10k
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

fi