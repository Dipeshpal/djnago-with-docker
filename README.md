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
or `sudo docker run -itd - 9010:8010 <image_name>`
(External_Port:Internal_Port)

![11](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/11.PNG)

You will have container id as output.

9. Now check your new container, you will find something new: `sudo docker ps`

	You will find contatiner up and running, just check ports number field.   

 10. Now go to browser of VM / Main Machine / Host Machine and hit this URL in address bar: "localhost:8000", or "0.0.0.0:8000" if all host allowed in settings.py in djnago app.
 
 ![51](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/Screenshot%20%2851%29.png)

![52](https://raw.githubusercontent.com/Dipeshpal/djnago-with-docker/master/raw/Screenshot%20%2852%29.png)


### Some useful commands-

**1.  Displaying Running Container**

```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
df2caf9283e8        nginx               "nginx -g 'daemon of…"   35 seconds ago      Up 34 seconds       0.0.0.0:80->80/tcp   vigorous_jang

```
**2. Export container into tar**
```
$ docker export df2 > nginx.tar
```
**3. Import container from tar**
```
docker import - mynginx < nginx.tar
```
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mynginx             latest              aaaed50d250a        25 seconds ago      107MB
nginx               latest              568c4670fa80        2 weeks ago         109MB
```
**4. Create tar from Images (already commited)** 
If you would rather deal with images that you have already committed, you can use the load and save commands:

```
$ docker save -o mynginx1.tar nginx

```

```
$ ls -l
total 218756
-rw-------    1 root     root     112844800 Dec 18 02:53 mynginx1.tar
-rw-r--r--    1 root     root     111158784 Dec 18 02:50 nginx.tar
```
This will create a tar.
 
**5. Load Image from tar.**

Run the below command to load Docker image into your system:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

```
$ docker load < mynginx1.tar
Loaded image: nginx:latest

```

```
[node1] (local) root@192.168.0.33 ~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              568c4670fa80        2 weeks ago         109MB
[node1] (local) root@192.168.0.33 ~
$
```

Now run this image to start container.



