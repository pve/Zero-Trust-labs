# Zero Trust lab - 1 - Kubernetes Cilium

Objective: to demonstrate how Cilium and network policies reduce network traffic

Prerequisites: Digital Ocean account, or other with Cilum baked in.

## Create a Kubernetes cluster

Create a Kubernetes cluster on Digital Ocean.

This is likely to include Cilium as the default CNI (Containter Network Interface).

```zsh
setopt interactivecomments
# to allow # as comment interactively.
export KUBECONFIG=kubeconfig.yaml

# do we have a cluster?
kubectl get nodes
```

## Deploy a simple application

We'll deploy to simple containers in which we can run a network ping. Note that we label the containers.

```zsh
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

```zsh
kubectl create -f networkpolicy.yaml
```

## Test network connectivity again

Retry the ping above.

## Your turn

Now make a policy that allows ping to work from the other container only.

## Cleanup

```zsh
kubectl delete pod busybox1 busybox2
kubectl delete -f networkpolicy.yaml
```
