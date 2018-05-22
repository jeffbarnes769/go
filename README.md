#Docker images
The Go blog [https://blog.golang.org/docker] and 'Hello World' [https://golang.org/doc/install] are great introductions to Docker and Go. 

While ‘Fromgolang: onbuild’ make building images simple, Docker newbies (like me) then wonder about image size and security.  We run Aquasec scanner-cli in a POC for these tests, though there are other options.

Our onbuild ‘hello world’ image is over 700MB, with vulnerabilities:
<img src="img/onbuild.jpg" width="75">

We then play Docker by building various images by modifying the Dockerfile

REPOSITORY  TAG     SIZE
hello       v2      378MB
hello       v1      796MB
hello       v0      796MB

Hello:v0 has fewer vulnerabilities (but still too many) and is now nearly 800MB.  As well our CSB policy is too run containers as non-superuser.
<img src="img/hello0.jpg" width="75">

Hello:v1 runs as  non-root, but still exceeds the acceptable vulnerability threshold
<img src="img/hello1.jpg" width="75">

Hello:v2 passes our scan but is still larger than necessary.
<img src="img/hello2.jpg" width="75">

We look at multi-stage builds in Hello2 [https://github.com/jeffbarnes769/hello2]

There are numerous resources for securing containers, beginning with Understanding and Hardening Linux Containers [https://www.nccgroup.trust/us/our-research/understanding-and-hardening-linux-containers/]