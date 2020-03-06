# madana-communityhub 
:busts_in_silhouette: The MADANA Community Hub


## Build
Build using `$ mvn clean package`

#### Requirements
Maven 2 / 3<br/>
JDK 1.8<br/>


### Artifact
The result is packaged as deployable war which can be found under 

```
/target/madana-communityhub-{version}.war
```

## Configure
The Application can be configured with environment variables that are read on startup. An environment variable is a dynamic-named value that can affect the way running processes will behave on a computer. They are part of the environment in which a process runs. For example, a running process can query the value of the TEMP environment variable to discover a suitable location to store temporary files, or the HOME or USERPROFILE variable to find the directory structure owned by the user running the process.

### Required



|    Variable                          |    Defaultvalue           |    Description     |
| -------------                   |:-------------:           | -----:       |
|    RESTURI     |        https://localhost:8080/madana-api/rest      |     REST Connection endpoint URL |
|    CERTIFICATE     |            |     |

<br><br/>
### Optional
#### Enabling medium newsfeed
Medium is an online publishing platform owned by A Medium Corporation. The platform is an example of social journalism, having a hybrid collection of amateur and professional people and publications, or exclusive blogs or publishers on Medium. rsstojson is used to display the latest post on the front-page and show the feed on the newspage.


|    Variable                          |    Defaultvalue           |    Description     |
| -------------                   |:-------------:           | -----:       |
|    MEDIUM_FEEDURL     |              |  For own publications the /feed url (  https://blog.madana.io/feed/  ) can be used. For personal accounts it would be https://medium.com/feed/#Medium# where #Medium# is your username. More info on this can be found here in the medium documentation.|

<br><br/>

#### Enabling google reCAPTCHA protection
reCAPTCHA is a free service that protects your website from spam and abuse. reCAPTCHA uses an advanced risk analysis engine and adaptive challenges to keep automated software from engaging in abusive activities on your site. It does this while letting your valid users pass through with ease.)<br/>
The Application is able to restrict login / singup  by defining the following environment variables:<br/>


|    Variable                          |    Defaultvalue           |    Description     |
| -------------                   |:-------------:           | -----:       |
|    GOOGLECAPTCHA_WEBSITEKEY     |              |     reCAPTCHAv3 WebsiteKey provided from https://www.google.com/recaptcha |
|    GOOGLECAPTCHA_SECRETKEY      |             |       reCAPTCHAv3 Token Secretkey from https://www.google.com/recaptcha/ |
|    GOOGLECAPTCHA_TRUSTSCORE     |    0.2                   |      A threshold for the trustscore can be set between 0 and 1 ( double ). The default is set to 0.2  |
|    GOOGLECAPTCHA_VERIFYURL      |    https://www.google.com/recaptcha/api/siteverify      |        |


 For more information on recaptcha v3 please refer to the [google recaptcha documentation](https://developers.google.com/recaptcha/docs/v3) <br><br/>
 
#### Enabling google analytics tracking 
Google analytics is used to track website activity such as session duration, pages per session, bounce rate etc. of individuals using the site, along with the information on the source of the traffic. It can be integrated with Google Ads, with which users can create and review online campaigns by tracking landing page quality and conversions (goals).


|    Variable                          |    Defaultvalue           |    Description     |
| -------------                   |:-------------:           | -----:       |
|    GOOGLEANALYTICS_TRACKINGID     |              |   The tracking ID is a string like UA-000000-2. It must be included in your tracking code to tell Analytics which account and property to send data to. |

<br><br/>
#### Enabling atlassian StatusPage widget
With the atlassian Status API and widget, you can embed system status into your own app, website, help desk, or anywhere else your users visit for support. 


|    Variable                          |    Defaultvalue           |    Description     |
| -------------                   |:-------------:           | -----:       |
|    STATUSPAGE_PAGEID     |              |   41zg6jaxxxx |

<br><br/>

## Run with tomcat

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



##  Run with docker

All versions are deployed to the gitlab [docker repository](https://gitlab.com/madana-io/madana-communityhub/container_registry)
To run the latest version using docker run

```
 docker run -p 9280:8080 --rm -it --privileged=true  --env GOOGLECAPTCHA=6LeSsno... --env RESTURI=https://localhost:8080/madana-api/rest registry.gitlab.com/madana-io/madana-communityhub:latest
```

#### -p 9280:8080
To expose a containerÃ¢â‚¬â„¢s internal port, an operator can start the container with the -P or -p flag. The exposed port is accessible on the host and the ports are available to any client that can reach the host.
The port number inside the container (where the service listens) does not need to match the port number exposed on the outside of the container (where clients connect). For example, inside the container an HTTP service is always listening on port 8080. At runtime, the port might be bound to 10280 on the host to run a second node on the same host by using 
```
 docker run -p 10280:8080 --rm -it --privileged=true  --env GOOGLECAPTCHA=6LeSsno... --env RESTURI=https://localhost:8080/madana-api/rest registry.gitlab.com/madana-io/madana-communityhub:latest
```

#### --rm
By default a containerÃ¢â‚¬â„¢s file system persists even after the container exits. This makes debugging a lot easier (since you can inspect the final state) and you retain all your data by default. But if you are running short-term foreground processes, these container file systems can really pile up. If instead youÃ¢â‚¬â„¢d like Docker to automatically clean up the container and remove the file system when the container exits, you can add the --rm flag:

```
--rm=false: Automatically remove the container when it exits
```
#### -it --privileged=true
By default, Docker containers are Ã¢â‚¬Å“unprivilegedÃ¢â‚¬ï¿½ and cannot, for example, run a Docker daemon inside a Docker container. This is because by default a container is not allowed to access any devices, but a Ã¢â‚¬Å“privilegedÃ¢â‚¬ï¿½ container is given access to all devices (see the documentation on cgroups devices).

When the operator executes docker run --privileged, Docker will enable access to all devices on the host as well as set some configuration in AppArmor or SELinux to allow the container nearly all the same access to the host as processes running outside containers on the host. Additional information about running with --privileged is available on the Docker Blog.

