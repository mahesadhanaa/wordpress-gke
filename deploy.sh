# remote GKE

gcloud container clusters get-credentials namecluster --zone asia-southeast1-a --project nameproject

# deploy mysql and wordpress

kubectl apply -f mysql-yaml/

kubectl apply -f wp-yaml/

# Will run forever...
external_ip=""
service="wordpress"
while [ -z $external_ip ]; do
 echo "tunggu sampai deploy selesai ..."
 external_ip=$(kubectl get svc $service --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
 [ -z "$external_ip" ] && sleep 10
done
echo 'ini url web nya:' && echo $external_ip