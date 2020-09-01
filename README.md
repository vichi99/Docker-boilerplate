# My personally boilerplate for using Docker

# Use cases


- ## Create react app with typescript

        $ /bin/bash node_cmd.sh 12 npx create-react-app my-app --template typescript

- ## Develop react app
    
    Keep node_modules inside container -> do not need install node on host(local pc).
  - [Dockerfile](develop_react_app/Dockerfile)
  - [docker-compose](develop_react_app/docker-compose.yaml)
  - [.dockerignore](develop_react_app/.dockerignore)
  - For run/build with correct container and keep consistency run only like this:
            
        $ docker-compose up 
  - For add some node packages into current container -> connect only into started container with `exec`. Our case name of services is `frontend`. At documentation I found write a container-name, but I don't know for me is only working with service name. Sometime you have to reload scripts in repository by `ctrl (cmd) + s`
    
        # add dependencies
        $ docker-compose exec -it frontend yarn add axios
        # connect into shell
        $ docker-compose exec -it frontend sh 


# Tips

- ## Docker sync - macOS $ Windows

    Some processes using Docker for Mac (or Windows) can be very slowly. The problems has their roots in the OS file system layer between Docker and OS. On linux, Docker can directly mount files and folders from file system, while on Mac docker has to pass the request to the OS which takes care of writin the file to the disk.

    For this reason can be useful [docker-sync](http://docker-sync.io/) tool. Etc. share big size folders like `node_modules`.

    ### Useful Links about Docker-sync:
    - [docker-sync documentation](https://docker-sync.readthedocs.io/en/latest/)
    - [Boilerplate - some github skilled user](https://github.com/EugenMayer/docker-sync-boilerplate)
    - [Cut your Docker for Mac response times in half with docker-sync](https://dev.to/kovah/cut-your-docker-for-mac-response-times-in-half-with-docker-sync-1e8j)


- ## Useful links about Docker

  - [Dockerfile reference - official](https://docs.docker.com/engine/reference/builder/)
  - [Docker-compose reference - official](https://docs.docker.com/compose/compose-file/)
  - [Very useful recipe for starting with docker](https://docker-curriculum.com/#prerequisites)
  - [Here’s How You Can Use Docker With React](https://medium.com/better-programming/heres-how-you-can-use-docker-with-create-react-app-3ee3a972b04e)
  - [Using Docker for Node.js in Development and Production](https://dev.to/alex_barashkov/using-docker-for-nodejs-in-development-and-production-3cgp)

- ## Scripts

  - Through this script [node_cmd.sh [node_version] [command]](node_cmd.sh) .
    
          $ docker run -it --rm -v $PWD:/usr/src/app -w /usr/src/app node:${node_version} ${command}

      You can use some node commands by node image like:
      - `npx create-react-app my-app --template typescript`
      - `yarn install`
      - `npm start` 
  

- ## Code

    ``` 
    docker ps //To show only running containers

    docker ps -a //To show all containers

    docker ps -l //To show the latest created container

    docker ps -n=-1  //To show n last created containers

    docker ps -s  //To display total file sizes

    docker system df //show size all files of docker

    docker rmi $(docker images -a -q) //remove all images

    docker rm $(docker ps -a -f status=exited -q) //remove all exited containers

    docker volume ls //list of volumes

    docker volume prune //remove all volumes

    docker port container_name //see runing ports of current container

    docker search [name-image] //search current image at docker repo

    docker pull [name-image] // pull current image into docker local directory
    ```



