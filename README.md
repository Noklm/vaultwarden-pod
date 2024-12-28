# Vaultwarden with Podman
## Installation
```sh
git clone https://github.com/Noklm/vaultwarden-pod.git
cd vaulwarden-pod
```
### [Podman secrets](https://docs.podman.io/en/latest/markdown/podman-secret-create.1.html)
-   Admin token secret:

Create your admin token secret and save the password in a safe place:
```sh
./hash.sh admin_token_secret.txt
chmod 600 admin_token_secret.txt
podman secret create vaultwarden_admin_token ./admin_token_secret.txt
```

-   Create domain secret
```sh
echo -n "http://localhost" > domain_secret.txt
chmod 600 domain_secret.txt
podman secret vaultwarden_domain ./domain_secret.txt
```

### Run Vaulwarden
```sh
./run.sh
```

## Backup & Restore
[To back up data](https://github.com/dani-garcia/vaultwarden/wiki/Backing-up-your-vault), export vaultwarden volume:
```sh
podman volume export vw-data --output "$(date +"%y%m%d")_vw-data.tar"
```

Restore with volume import:
```sh
podman volume import vw-data 241228_vw-data.tar
```