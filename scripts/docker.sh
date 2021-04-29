#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("bash" "reset" "logs" "kill" "start_testnet" "start_testnet_local" "start_mainnet" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")            
            cmd="docker exec -it $(docker ps --latest --quiet) bash"
            echo $cmd
            $cmd
            ;;
        "reset")
            cmd="docker system prune -a"
            echo $cmd
            $cmd
            ;;
        "logs")
            cmd="docker ps -q | xargs -L 1 docker logs -f"
            echo $cmd
            $cmd            
            ;;
        "kill")
            cmd="docker kill $(docker ps -q)"
            echo $cmd
            $cmd            
            ;;

        "start_testnet")
            cmd="docker-compose -f docker-compose-testnet.yml up -d"
            echo $cmd
            $cmd            
            ;;
        
        "start_testnet_local")
            cmd="docker-compose -f docker-compose-testnet.yml --env-file .env up -d"
            echo $cmd
            $cmd            
            ;;

        "start_mainnet")
            cmd="docker-compose -f docker-compose.yml up -d"
            echo $cmd
            $cmd            
            ;;

        "quit")
            break
            ;;
            
        *) 
            PS3="" # this hides the prompt
            echo asdf | select foo in "${options[@]}"; do break; done # dummy select 
            PS3="Please enter your choice: " # this displays the common prompt
            ;;
    esac
done