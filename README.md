# ansible-home
Create a site.yml based off the site.example.yaml

## Running locally
ansible-playbook -l <local node name> site.yml -c local

## Running remotely
ansible-playbook -l <remote node name> site.yml

## Adding Dave
./dave.yaml --extra-vars "hostname=<hostname>" -Kk
