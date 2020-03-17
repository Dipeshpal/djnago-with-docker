# Up and run Django project in Docker

## Steps-

1. Put this [repository](https://github.com/Dipeshpal/djnago-with-docker/tree/master/) somewhere in VM / Main Machine / Host Machine. And open terminal in same folder.
![01](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/01.PNG)

2. Change dir in "djnago-with-docker", you must have "docker-entrypoint.sh", "Dockerfile" files and "mysite" folder. Type `ls` to check.

![02](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/02.PNG)

3. Make the file "docker-entrypoint.sh" executable and change permission type: `chmod u+x docker-entrypoint.sh`

![03](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/03.PNG)

4. Now check your existing images (Optional): `sudo docker images`

5. Now check your existing containers (Optional): `sudo docker ps`

![04](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/04.PNG)

Here you can see we don't have any image or container.

6. Now create docker image first by using "Dockerfile": `sudo docker build -t <image_name> -f Dockerfile .`

![05](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/05.PNG)

It may take few minutes.

After few minutes-

![06](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/06.PNG)


7. Once image is created successfully, then check image name: `sudo docker images`

![07](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/07.PNG)

8. Now we will create container with above image: `sudo docker container run --publish 8000:8002 --detach --name <container_name> <image_ID>`

![08](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/08.PNG)

You will have container id as output.

9. Now check your new container, you will find something new: `sudo docker ps`

 10. Now go to browser of VM / Main Machine / Host Machine and hit this URL in address bar: "localhost:8000", or "0.0.0.0:8000" if all host allowed in settings.py in djnago app.
