kubectl get nodes
kubectl cluster-info
kubectl create deployment nginx-deployment --image nginx --replicas 2
kubectl get deployment nginx-deployment
kubectl get pods
kubectl expose deployment nginx-deployment --type NodePort --port 80
kubectl get svc nginx-deployment
# Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl get pods,svc -n kubernetes-dashboard
kubectl patch svc kubernetes-dashboard --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]' -n kubernetes-dashboard
kubectl get svc -n kubernetes-dashboard
cat > k3s-dashboard.yaml <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system
EOF
kubectl create -f k3s-dashboard.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
