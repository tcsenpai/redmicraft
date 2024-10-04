# RedmiCraft

RedmiCraft is a Minecraft server setup for Termux.

It aims to be a simple and easy-to-use set of scripts to get a Minecraft server running on Termux in a reliable and secure manner.

- [RedmiCraft](#redmicraft)
  - [Features](#features)
  - [Installation](#installation)
    - [Automated installation](#automated-installation)
    - [Manual installation](#manual-installation)
  - [Compatibility](#compatibility)
    - [Requirements](#requirements)
  - [Tips](#tips)
    - [Keep the server running in the background](#keep-the-server-running-in-the-background)
    - [Use SSH to connect to the server](#use-ssh-to-connect-to-the-server)
  - [Disclaimer](#disclaimer)

## Features

- [x] Install dependencies
- [x] Download and setup Minecraft server
- [x] Fabric support
- [ ] Optional choice between Vanilla and Fabric

## Installation

### Automated installation

1. Install Termux from [their GitHub Releases](https://github.com/termux/termux-app/releases) (**_IMPORTANT_**: The Play Store version is not supported and could cause issues).
2. Open Termux and run the following command to install `git`:

   ```bash
   pkg install git -y
   ```

3. Clone the repository and cd into it

   ```bash
   git clone https://github.com/yourusername/redmicraft.git
   cd redmicraft
   ```

4. Launch `install.sh`

   ```bash
   ./install.sh
   ```

**_NOTE:_** This will also launch the server. You can stop the server by pressing `Ctrl + C` in the Termux app and run it again by executing `java -Xmx2G -jar server.jar nogui` or using the `run.sh` script.

### Manual installation

1. Install Termux from [their GitHub Releases](https://github.com/termux/termux-app/releases) (**_IMPORTANT_**: The Play Store version is not supported and could cause issues).
2. Run the following commands to install dependencies:

   ```bash
   pkg update
   pkg add openjdk-17
   pkg add curl
   ```

3. Setup storage

   ```bash
   cd
   termux-setup-storage
   cd storage/shared
   mkdir redmicraft
   cd redmicraft
   ```

4. Download the server files

   ```bash
   curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.16.5/1.0.1/server/jar
   mv fabric-server-mc.1.20.4-loader.0.16.5-launcher.1.0.1.jar server.jar
   ```

5. Launch the server

   ```bash
   java -Xmx2G -jar server.jar nogui
   ```

**_NOTE:_** To stop the server, press `Ctrl + C` in the Termux app. To start the server again, run the above command once more.

_TIP: You can easily save the above command as a script by creating a file named `run.sh` with the following content:_

```bash
#! /bin/bash

cd
cd storage/shared/redmicraft
java -Xmx2G -jar server.jar nogui
```

## Compatibility

This setup is designed to work with Termux on Android devices. It may work on other Android terminals, but this is not guaranteed.

### Requirements

- [Termux](https://github.com/termux/termux-app/releases) (not the Play Store version)
- Android 5.0+
- At least 3GB RAM (4GB recommended)

## Tips

**_NOTE:_** While not required, it is highly recommended following the below steps for a smoother experience.

### Keep the server running in the background

It is advised to use an utility like `screen` to keep the server running in the background.

    ```bash
    pkg install screen -y
    screen -R redmicraft
    [the command to launch the server on your setup]
    ```

You will then be able to detach from the screen by pressing `Ctrl + A` followed by `D`.

To reattach to the screen, run `screen -r redmicraft`.

### Use SSH to connect to the server

You can use SSH to connect to the server from your computer.

    ```bash
    pkg install openssh -y
    sshd
    ifconfig
    whoami
    ```

Running the above command will start the SSH server and print the IP address of your device (usually starting with `192.168.`) followed by your username. You can now connect to the server with SSH from your computer.

_TIP: You can run the SSH server automatically on startup by adding the following line to your `~/.bashrc` file (or the corresponding file for your shell if it does not exist):_

    ```bash
    # ...
    # Start the SSH server on startup
    sshd
    ```

**_NOTE:_** You will need to set up a password for your user, if you haven't already. You can do this by running the following command:

    ```bash
    passwd
    ```

You can now connect to the server with SSH from your computer.

    ```bash
    ssh yourusername@your-device-ip -p 8022
    ```

## Disclaimer

This is a simple and easy-to-use setup for Termux. It is not affiliated with or endorsed by Minecraft, Mojang or its developers. Use at your own risk.

You will need to have a Minecraft account to use a server created with this setup.
