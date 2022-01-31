### Task 1 - Download the monolith code and build your container
1. Run `. step-1.sh`
2. Open another terminal (in Cloud Shell, click the + icon), and test the server: `curl http://localhost:4000`
3. docker ps
4. docker logs [container_id]
5. Edit app.js with a text editor of your choice (for example nano or vim) and replace "Hello World" with another string:
`....
   const server = http.createServer((req, res) => {
   res.statusCode = 200;
   res.setHeader('Content-Type', 'text/plain');
   res.end('Welcome to Cloud\n');
   });
   ....`
6. Run `. step-2.sh`
7. docker ps
8. Open another terminal (in Cloud Shell, click the + icon) and enter the following command:
`docker exec -it [container_id] bash`
9. `ls` -> `exit`
10. Examine a container's metadata in Docker by using Docker inspect:
`docker inspect [container_id]
`   
11. `docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [container_id]`