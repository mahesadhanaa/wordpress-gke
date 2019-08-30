# wordpress-gke

1. create cluster in GKE
2. install google SDK
3. run deploy.sh

note for scalling deployment, we can add replicas in deployment.yaml or use thi command :

kubectl scale --current-replicas=2 --replicas=3 deployment/mysql

kubectl scale --current-replicas=2 --replicas=3 deployment/wordpress
