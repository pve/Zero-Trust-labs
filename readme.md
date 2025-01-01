# Zero Trust lab - 1 - Kubernetes Cilium

Objective: to demonstrate how Cilium and network policies reduce network traffic

Prerequisites: Digital Ocean account.

## Create a Kubernetes cluster

Create a Kubernetes cluster on Digital Ocean.

This is likely to include Cilium as the default CNI (Containter Network Interface).

export KUBECONFIG=k8s-1-31-1-do-5-ams3-1735750671919-kubeconfig.yaml

kubectl get nodes

## Deploy a simple application

We'll deploy to simple containers in which we can run a network ping. Note that we label the containers.

```bash
export KUBECONFIG=kubeconfig.yaml
kubectl run busybox1 --image=busybox --labels app=busybox1 -- sleep 3600
kubectl run busybox2 --image=busybox --labels app=busybox2 -- sleep 3600

kubectl get pods
```

You should see the IP adresses of the pods.

## Test network connectivity

Access one of the containers through `kubectl` and ping the other. Substitute the IP addresses of the relevant pod.

```bash
kubectl exec -ti busybox2 -- ping -c3 <ip address>
```

## Create network policies

```bash
kubectl create -f networkpolicy.yaml
```

## Test network connectivity again

Retry the ping above.

