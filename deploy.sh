kubectl apply -f mysql-yaml/

kubectl apply -f wp-yaml/

sleep 60

kubectl get svc wordpress