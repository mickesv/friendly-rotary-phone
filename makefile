go: clean run delay enter

build:
	docker build -t timething .

push:
	docker tag timething:latest mickesv/timething:v1
	docker push mickesv/timething:v1

kubestart:
	minikube status || minikube start

run: kubestart
	kubectl apply -f timething.yaml

enter:
	minikube service timemain

status:
	kubectl get all

logs:
	kubectl logs -l "app=timemain"

inspect:
	kubectl describe svc/timemain
	@echo "--------------------"
	kubectl describe pod -l "app=timemain"

clean:
	kubectl delete -f timething.yaml

delay:
	sleep 10
