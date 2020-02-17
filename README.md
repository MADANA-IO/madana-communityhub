# madana-communityhub 
:busts_in_silhouette: The MADANA Community Hub


## Build
Build using `$ mvn clean package`

#### Requirements
Maven 2 / 3<br/>
JDK 1.8<br/>


### Artifact
The result is packaged as deployable war which can be found under `/target/madana-communityhub-{version}.war`


## Environment Variables
##### Required variables


`GOOGLECAPTCHA=6LeSsno...` (reCAPTCHAv3 Token provided from https://www.google.com/recaptcha/)<br>
reCAPTCHA is a free service that protects your website from spam and abuse. reCAPTCHA uses an advanced risk analysis engine and adaptive challenges to keep automated software from engaging in abusive activities on your site. It does this while letting your valid users pass through with ease.)<br/>

`RESTURI=https://localhost:8080/madana-api/rest` ( Connection URL of API REST Context )<br/>



## Deploy to Tomcat

### Requirements
Tomcat 8.5+<br/>


A Context is what Tomcat calls a web application.

In order to configure a Context within Tomcat a Context Descriptor is required. A Context Descriptor is simply an XML file that contains Tomcat related configuration for a Context, e.g naming resources or session manager configuration. In earlier versions of Tomcat the content of a Context Descriptor configuration was often stored within Tomcat's primary configuration file server.xml but this is now discouraged (although it currently still works).

Context Descriptors not only help Tomcat to know how to configure Contexts but other tools such as the Tomcat Manager and TCD often use these Context Descriptors to perform their roles properly.

The Context related web.xml can be found under

```
src/main/webapp/WEB-INF
```

### Deployment on Tomcat Startup
The location you deploy web applications to for this type of deployment is called the appBase which is specified per Host. You either copy a so-called exploded web application, i.e non-compressed, to this location, or a compressed web application resource .WAR file.

Any Context Descriptors will be deployed first.

Exploded web applications not referenced by any Context Descriptor will then be deployed. If they have an associated .WAR file in the appBase and it is newer than the exploded web application, the exploded directory will be removed and the webapp will be redeployed from the .WAR

The default appbase is located under

```
$CATALINA_BASE/webapps
```


### Deploying on a running Tomcat server
It is possible to deploy web applications to a running Tomcat server.

If the Host autoDeploy attribute is "true", the Host will attempt to deploy and update web applications dynamically, as needed, for example if a new .WAR is dropped into the appBase. For this to work, the Host needs to have background processing enabled which is the default configuration.



##  Run Application using docker

All versions are deployed to the gitlab [docker repository](https://gitlab.com/madana-io/madana-communityhub/container_registry)
To run the latest version using docker run

```
 docker run -p 9280:8080 --rm -it --privileged=true  --env GOOGLECAPTCHA=6LeSsno... --env RESTURI=https://localhost:8080/madana-api/rest registry.gitlab.com/madana-io/madana-communityhub:latest
```

#### -p 9280:8080
To expose a container’s internal port, an operator can start the container with the -P or -p flag. The exposed port is accessible on the host and the ports are available to any client that can reach the host.
The port number inside the container (where the service listens) does not need to match the port number exposed on the outside of the container (where clients connect). For example, inside the container an HTTP service is always listening on port 8080. At runtime, the port might be bound to 10280 on the host to run a second node on the same host by using 
```
 docker run -p 10280:8080 --rm -it --privileged=true  --env GOOGLECAPTCHA=6LeSsno... --env RESTURI=https://localhost:8080/madana-api/rest registry.gitlab.com/madana-io/madana-communityhub:latest
```

#### --rm
By default a container’s file system persists even after the container exits. This makes debugging a lot easier (since you can inspect the final state) and you retain all your data by default. But if you are running short-term foreground processes, these container file systems can really pile up. If instead you’d like Docker to automatically clean up the container and remove the file system when the container exits, you can add the --rm flag:

```
--rm=false: Automatically remove the container when it exits
```
#### -it --privileged=true
By default, Docker containers are “unprivileged” and cannot, for example, run a Docker daemon inside a Docker container. This is because by default a container is not allowed to access any devices, but a “privileged” container is given access to all devices (see the documentation on cgroups devices).

When the operator executes docker run --privileged, Docker will enable access to all devices on the host as well as set some configuration in AppArmor or SELinux to allow the container nearly all the same access to the host as processes running outside containers on the host. Additional information about running with --privileged is available on the Docker Blog.

