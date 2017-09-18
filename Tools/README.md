# Tools
This folder contain some tools to monitor gpu usage.

## gpu-moniter
This is a little tool to notify you by slack when your server's gpu is available.
you need to install: pynvml

step 1: Place gpu-moniter.py on you server and 

step 2: Use crontab -e to create a job(ex: */5 * * * *  /path/to/your/script/gpu-script.sh )

step 3: Configure your slack web-hook and place it in gpu-moniter.py

You will be notified by a text message in the slack channel you configured in step 3.

## gpu-status
List all GPU status on the server. This script is borrowed from [here](https://gist.github.com/SSARCandy/46da40fb53d7d49b10a4c38e6f96ae23)
