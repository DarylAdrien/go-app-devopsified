kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'  (loadbalancer or NodePort)


kubectl port-forward svc/argocd-server -n argocd 8080:443  (locally)
