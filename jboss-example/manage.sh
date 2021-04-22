#
sudo podman stop jboss-multistage
sudo podman rm jboss-multistage
#force stop && remove
sudo podman rm jboss-multistage -f

sudo podman tag jboss-multistage quay.io/haroonob/jboss-multistage
sudo podman push quay.io/haroonob/jboss-multistage


sudo podman save -o jboss-multistage.tar quay.io/haroonob/jboss-multistage
sudo podman load -i jboss-multistage.tar

sudo podman exec -it jboss-multistage /bin/bash

sudo podman commit -a "test" jboss-multistage jboss-multistage:v1

sudo podman logs --tail 10 jboss-multistage

sudo podman cp jboss-multistage:/opt/jboss7/jboss-eap-7.4/version.txt  version.txt
sudo podman cp run.sh jboss-multistage:/opt/jboss7/jboss-eap-7.4/
