# kind + kubectl + kubectx + kubens

## Kind basic commands:

- Quickstart with Kind, installation etc. 
   - https://kind.sigs.k8s.io/docs/user/quick-start


```sh
kind create cluster # creates cluster with default name/settings: "kind"
kind create cluster --name $NAME_OF_CLUSTER # with specific name
kind get clusters

# Getting info using kubectl.
kubectl cluster-info --context $NAME_OF_CLUSTER
kubectl config get-contexts

kind delete cluster
kind delete cluster --name $NAME_OF_CLUSTER
```

## kubectl install:
 - [kubectl-install](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
 
 ## kubens and kubectx 

 ```sh
 brew install kubectx
 brew install fzf
```

## minikube:

Minikube works ok on Apple-silicon M2 as long as uses Docker as a driver. VirtualBox-Beta for Arm is not supported as a driver (VirtualBox-7.0.0_BETA1-153351-macOSAArch64.dmg)

- https://minikube.sigs.k8s.io/docs/start/

This means that you cannot directly access NodePorts, but need to open it using cumbersome:

`minikube service <NAME-OF-SERVICE-TO-CONNECT-TO>`

e.g: `minikube service kiali -n istio-system`

Starting with extra memory:

`minikube start --memory 4096`




