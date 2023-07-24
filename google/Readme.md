# 1. connect to google cloud shell
![image](https://github.com/khkwon01/kubernetes-for-oracle/assets/8789421/c24fde1c-5790-40fe-8a58-29b463c12f7a)

# 2. make goole kubernetes engine using shell
- setup zone
  - export MY_ZONE="Zone"
- create gke with 2 vm nodes
  - gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2
- check kubernetes version
  - kubectl version
- run and deploy a service in kubernetes
  - kubectl create deploy nginx --image=nginx:1.17.10                  // nginx pod create (default pod number : 1)
  - kubectl get pods                                                   // view the pod running the nginx container
  - kubectl expose deployment nginx --port 80 --type LoadBalancer      // create service with external load balancer using public ip
  - kubectl get services                                               // view the new service
  - kubectl scale deployment nginx --replicas 3                        // increase the number of pods running on service to 3

=======================================================================================================
```
Welcome to Cloud Shell! Type "help" to get started.
Your Cloud Platform project in this session is set to qwiklabs-gcp.
student_02@cloudshell:~ (qwiklabs-gcp)$ gcloud container clusters create webfrontend --zone $MY_ZONE
 --num-nodes 2Default change: VPC-native is the default mode during cluster creation for versions greater than 1.21.0-gke.1500. To create advancedYour Cloud Platform project in this session is set to qwiklabs-gcp.Use “gcloud config set project [PROJECT_ID]” to change to a different project.student_02@cloudshell:~ (qwiklabs-gcp)$ export MY_ZONE="us-west3-a"student_02@cloudshell:~ (qwiklabs-gcp)$ gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2Default change: VPC-native is the default mode during cluster creation for versions greater than 1.21.0-gke.1500. To create advanced routes based clusters, please pass the `--no-enable-ip-alias` flagDefault change: During creation of nodepools or autoscaling configuration changes for cluster versions greater than 1.24.1-gke.800 a default location policy is applied. For Spot and PVM it defaults to ANY, and for all other VM kinds a BALANCED policy is used. To change the default values use the `--location-policy` flag.Note: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).Creating cluster webfrontend in us-west3-a... Cluster is being configured...working...                                                                                                                                                                                                                                                                                                                               Creating cluster webCreating cluster webfrontend in us-west3-a... Cluster is being deployed...working.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Creating cluster webfrontend in us-west3-a... Cluster is being health-checked (master is healthy)...done.                                                                
Created [https://container.googleapis.com/v1/projects/qwiklabs-gcp/zones/us-west3-a/clusters/webfrontend].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-west3-a/webfrontend?project=qwiklabs-gcp
kubeconfig entry generated for webfrontend.
NAME: webfrontend
LOCATION: us-west3-a
MASTER_VERSION: 1.26.5-gke.1200
MASTER_IP: 34.106.207.116
MACHINE_TYPE: e2-medium
NODE_VERSION: 1.26.5-gke.1200
NUM_NODES: 2
STATUS: RUNNING
student_02@cloudshell:~ (qwiklabs-gcp)$ kubectl version
WARNING: This version information is deprecated and will be replaced with the output from kubectl version --short.  Use --output=yaml|json to get the full version.
Client Version: version.Info{Major:"1", Minor:"27", GitVersion:"v1.27.3", GitCommit:"25b4e43193bcda6c7328a6d147b1fb73a33f1598", GitTreeState:"clean", BuildDate:"2023-06-14T09:53:42Z", GoVersion:"go1.20.5", Compiler:"gc", Platform:"linux/amd64"}
Kustomize Version: v5.0.1
Server Version: version.Info{Major:"1", Minor:"26", GitVersion:"v1.26.5-gke.1200", GitCommit:"4eb57372b0f0ac0023caca078161b75185febeef", GitTreeState:"clean", BuildDate:"2023-06-01T19:55:11Z", GoVersion:"go1.19.9 X:boringcrypto", Compiler:"gc", Platform:"linux/amd64"}
student_02_413fe6e56a51@cloudshell:~ (qwiklabs-gcp-01-b9fb928d144a)$ kubectl create deploy nginx --image=nginx:1.17.10
deployment.apps/nginx created
student_02@cloudshell:~ (qwiklabs-gcp)$ kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
nginx-9f47647b9-5p7nv   1/1     Running   0          77s
student_02@cloudshell:~ (qwiklabs-gcp)$ kubectl expose deployment nginx --port 80 --type LoadBalancer
service/nginx exposed
student_02@cloudshell:~ (qwiklabs-gcp)$ kubectl get services
NAME         TYPE           CLUSTER-IP   EXTERNAL-IP      PORT(S)        AGE
kubernetes   ClusterIP      10.36.0.1    <none>           443/TCP        7m7s
nginx        LoadBalancer   10.36.7.17   34.106.199.206   80:32327/TCP   61s
student_02@cloudshell:~ (qwiklabs-gcp-01)$ kubectl scale deployment nginx --replicas 3
deployment.apps/nginx scaled
student_02@cloudshell:~ (qwiklabs-gcp-01)$ kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
nginx-9f47647b9-5p7nv   1/1     Running   0          3m59s
nginx-9f47647b9-kx8kv   1/1     Running   0          7s
nginx-9f47647b9-rpmvj   1/1     Running   0          7s
student_02@cloudshell:~ (qwiklabs-gcp)$ kubectl get services
NAME         TYPE           CLUSTER-IP   EXTERNAL-IP      PORT(S)        AGE
kubernetes   ClusterIP      10.36.0.1    <none>           443/TCP        9m6s
nginx        LoadBalancer   10.36.7.17   34.106.199.206   80:32327/TCP   3m
student_02_413fe6e56a51@cloudshell:~ (qwiklabs-gcp-01-b9fb928d144a)$
```
