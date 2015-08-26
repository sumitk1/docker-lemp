# docker-lemp
LEMP stack in Docker

To build an image - 
```bash
  $ git clone https://github.com/sumitk1/docker-lemp.git
  $ cd docker-lemp
  $ docker build -t test/lemp:1.0 . 
```
To mount you project which is at `/srv/project_lemp_dir` this is how you start the container
```
  $ docker run -d -P -v /srv/project_lemp_dir:/srv/http --name  test/lemp:1.0
```

