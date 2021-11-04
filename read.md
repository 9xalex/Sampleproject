# kubernets deployment for minikube

##### 

CI/CD Plan 
>>> everytime git push/ git merch will be crate new docker image with git ref prefix
>>> using helm to use latest image from global vairable of git ref perfix 
>>> start minikube 
>>> deploy to minkube with helm using terrafrom (heml.tf)
>>> database username pasword will be get from kubernetse sercert file //