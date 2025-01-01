export KUBECONFIG=k8s-1-31-1-do-5-ams3-1735750671919-kubeconfig.yaml
kubectl run busybox1 --image=busybox --labels app=busybox1 -- sleep 3600
kubectl run busybox2 --image=busybox --labels app=busybox2 -- sleep 3600

kubectl get pods -o wide

# will give you the ips of the pods
kubectl exec -ti busybox2 -- ping -c3 <ip address>
kubectl exec -ti busybox2 -- ping -c3  10.108.0.6

kubectl apply -f networkpolicy.yaml

# Cleanup: 
kubectl delete pod busybox1 busybox2
kubectl delete -f networkpolicy.yaml

