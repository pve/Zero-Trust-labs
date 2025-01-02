export KUBECONFIG=kubeconfig.yaml

# let's see if we have a Kubernetes cluster
kubectl get nodes

# run a few apps
kubectl run busybox1 --image=busybox --labels app=busybox1 -- sleep 3600
kubectl run busybox2 --image=busybox --labels app=busybox2 -- sleep 3600



kubectl get pods -o wide
# note the ips of the pods

kubectl exec -ti busybox2 -- ping -c3 <ip address>
kubectl exec -ti busybox2 -- ping -c3  10.108.0.6
# now you see me
kubectl apply -f networkpolicy.yaml

# now you don't 

kubectl get networkpolicy
kubectl describe networkpolicy web-deny-all

# Cleanup: 
kubectl delete pod busybox1 busybox2
kubectl delete -f networkpolicy.yaml

