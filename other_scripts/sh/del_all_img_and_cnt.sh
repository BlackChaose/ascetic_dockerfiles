#! /bin/bash
iname=$1
if [[ -z "$iname" ]] 
	then iname="testmysql5"
fi
if [[ $1 == "-d" ]]
then
	echo "run delete ALL images!"
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -a -q)
echo "DELETE"
	exit 0
fi
echo "run building images $iname";
sudo docker build -t "$iname" . 
sudo docker run -p 3306:3306 --name "$iname-cnt" -it "$iname" /bin/bash
echo "end building image $iname"
exit 0