# packer-hello-world
packer creates a customized image, you can deploy using docker aws azure etc. 
In this code i am creating a customized image based on ubuntu and deploying with docker. When you build the project, packer will create 2 images, one is the 
ubuntu "original" and the other one is the image customized
# How to run
1 - install packer
2 - install docker
3 - in the folder project, run this commands : 
```sh 
packer init .
```
```sh 
packer build helloworld.pkr.hcl
```
you may need root privelege for docker builds the images

after this steps you can find your images with this command : 
```sh 
docker images -a
```
this command list all images

And to inicialize a container use this command :

```sh 
docker container run -it --rm IMAGE_ID
```
-it means to run interactively

--rm means to destroy the container after we close the connection

## Code explain
the block required_plugins, tells packer we will use docker and packer will install this plugin, the source block tells packer we are using docker as a
"cloud" (source) and what image to use, the build block use the image we declare in the block source and create a custom image using the image as a "template",
the block provisioner will do what we want after the image is created, in this code we point to the file setup.sh, in this file you can configure anything
you need, like install something etc.
The post-processor basicly put a tag on the image in this example, there are others motives to use post-processor block, you can consult the documentation.
The setup.sh is where we configure our custom image.
