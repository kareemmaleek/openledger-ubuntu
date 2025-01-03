#!/usr/bin/env bash
echo -e "\e[92m"
cat << "EOF"
                                                   
                    :            .-.               
                  -#-    .-=      -#+.             
                :*#*    :-=*-      *#*-            
               -*#%+:*- -####:  -*.+%#*=           
              =##%###+  *%%###*. -###%##=          
             -*######=:+###*#*+*+*#######-         
             *########==+**+*****#########         
            :########+-=#********########*.        
            =###-###*=*#*=+*#**+*#####:##*-        
            +#+=-=***##*++=*#*******#= =*#+        
           .+*++..+=+*##*-+****#**:*#. :**+        
           .+#=:..=**###*++++**#**:-=:  **+        
            +*=:=*####******+*=*##.:=   ++=        
            -+-:* =####*+**=++=*##:..   -*.        
            -+. = .#****+*++++*###-     :+.        
            .*. :    =***#******##+     +*.        
             = ...   .+********###*     .*         
             :-  :    *+*+*#**####=     .=         
             := .-   .*+*+##+###*#*     +.         
              - -:   -#*####*###*##.    +          
              =  =.  =####*#*#*#**#=    =          
                 -: -##*##**##*#***=   .           
                 - :*#############*+               
            ::-:.=+##################=             
          .-**#***####*###############+:.          
           .==. .  .    -.-++**-=+*+=  .           

        _____ _ __              __  _______
       / ___/(_) /_  ___  _____/ / / /__  /
       \__ \/ / __ \/ _ \/ ___/ / / / /_ < 
      ___/ / / /_/ /  __/ /  / /_/ /___/ / 
     /____/_/_.___/\___/_/   \____//____/                                                                                                                                                                                                                              

============[ OpenLedger Installation ]============

EOF
echo -e "\e[0m" # Reset warna

install_prerequisite(){

    sudo apt update && sudo apt upgrade -y

    if ! command -v docker &> /dev/null; then
        echo -e "\e[92m"
        echo "Installing docker prerequisite..."
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
        
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update
        echo "Installing docker"
        sudo apt install docker-ce docker-ce-cli containerd.io -y
    fi

    echo -e "\e[92m"
    echo "Installing Desktop Display...."
    sudo apt install xfce4 xfce4-goodies
    echo "Installing RDP...."
    sudo apt install xrdp
    sudo systemctl enable xrdp
    sudo systemctl start xrdp
    sudo adduser root ssl-cert
    echo "Installing Package Installer...."
    sudo apt install gdebi

    echo "Done."

    ip_address=$(hostname -I | awk '{print $1}')

    echo "--------------------------------------------"
    echo "              Connect to RDP                "
    echo "--------------------------------------------"
    echo "           RDP Host: $ip_address            "
    echo " Open RDP then login with root credentials  "
    echo "--------------------------------------------"
    echo "!!! DONT FORGET FOR LOGIN VIA RDP FIRST !!!"
    echo "1. Upload the latest openledger version file or open terminal then download with command below:"
    echo "run command \"wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip\""
    echo "2. Unzip archived file"
    echo "3. Double Click or Open .deb extracted file"
    echo "4. Install Package"
    echo "5. Open Terminal, then run command "openledger-node --no-sandbox""
    echo "6. Follow step for setup node, Done"
    echo "---------------------------------------"
}

install_prerequisite
