# GCP Script Example

    gcloud beta compute instances create cs2moddedserver ^
    --maintenance-policy=MIGRATE ^
    --project=true-winter-417711 ^
    --zone=us-west3-a ^
    --machine-type=e2-standard-4 ^
    --network-tier=PREMIUM ^
    --metadata=RCON_PASSWORD=rconPASSWORDHERE,SERVER_PASSWORD=serverPASSWORDHERE,STEAM_ACCOUNT=manageGAMESERVERSCODEHERE,API_KEY=steamAPIKEYHERE,DUCK_DOMAIN=duckDNSDOMAINHERE,DUCK_TOKEN=duckDNSTOKENHERE,GIT_REPO=gitUSERNAMEHERE/repoHERE,startup-script="echo \"Delaying for 30 seconds...\" && sleep 30 && cd / && /gcp.sh" ^
    --no-restart-on-failure ^
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/compute.readonly,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append ^
    --tags=source ^
    --image-family=ubuntu-2204-lts ^
    --image-project=ubuntu-os-cloud ^
    --boot-disk-size=60GB ^
    --boot-disk-type=pd-standard ^
    --boot-disk-device-name=bootDISKNAMEHERE