# deploy mysql and wordpress

kubectl apply -f mysql-yaml/

kubectl apply -f wp-yaml/

# Will run forever...
external_ip=""
service="wordpress"
while [ -z $external_ip ]; do
 echo "Waiting for end point..."
 external_ip=$(kubectl get svc $service --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
 [ -z "$external_ip" ] && sleep 10
done
echo 'End point ready:' && echo $external_ip