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
