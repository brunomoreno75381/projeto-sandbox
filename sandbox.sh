#!/bin/bash

##################################
#Keystroke
SenhaPermissao=$(zenity --password)
echo "$senhaPermissao" | sudo -S ./aaa
sudo apt install xdotool
##################################
while true
do
escolherMetodo=$(zenity --list --column Calibrar "Kinect" "Projetor" "Projetor/Kinect" "Sair")

case "$escolherMetodo" in
	"Kinect")
sudo /usr/local/bin/KinectUtil getCalib 0
zenity --list --column "Tecla" --column "Função" "1" "Extract Planes" "2" "Measure 3D Points"
sudo /usr/local/bin/RawKinectViewer -compress 0


;;
    "Projetor")
cd ~/src/SARndbox-2.6
zenity --warning --width 300 --title "" --text "Faça a imagem cobrir toda área da sandbox"
XBackground & sleep 1
xdotool key F11
;;
    "Projetor/Kinect")
    cd ~/src/SARndbox-2.6
    zenity --list --column "Tecla" --column "Função" "1" "Capturar ponto" "2" "Resetar background"
    ./bin/CalibrateProjector -s 1024 768 -loadInputGraph calibracao_camera_projetor.inputgraph
;;

    "Sair")
 break
 ;;
esac

done
