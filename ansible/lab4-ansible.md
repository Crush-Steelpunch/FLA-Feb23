# Lab 4

Prerequisites: Ansible Host EC2, 2x EC2 instances with port 80 and 22 open, Ansible
Host can ssh to the other instances.
Using a combination of Global vars, playbook vars, and handlers, create a new
playbook that does the following tasks:
- Use the debug ansible module to print a message to the person running the playbook (make sure it isn't rude)
- Clones down `https://gitlab.com/Reece-Elder/reverseproxy-nginx` specified at command line  
  - ansible git module
  - declare and use a variable
- Installs a package specified at command line, e.g: 
  - unzip
  - ncdu
- Installs nginx and uses handlers to restart on both machines
  - refer to frontend and backend below for the correct configuration
    - frontend ansible modules for:
      - cloning a git repo
      - changing permission
      - running a script
    - backend, ansible module for:
      - cloning a git repo
      - changing permission 
      - running the script
      - to install the pre-written config


- Creates a new file and appends text using the ansible copy module


using lab3 from Nginx

Task – Use nginx as a reverse proxy for a pre built app
Prerequisite – 3x EC2 instances, each with port 22, 80 and 3000 open. Should be
called frontend, backend and reverse-proxy respectively
To set up the web app you must SSH into each machine and run the steps for each
below
Frontend & Backend
1) Update the package manager
2) Clone down this repo https://gitlab.com/Reece-Elder/reverseproxy-nginx
3) Navigate to the frontend or backend folder depending on machine
4) Run the setup.bash script (You may need to use chmod +x on script before
running)
Reverse-proxy
1) Update the package manager
2) Clone down the same repo and navigate to the reverse-proxy folder
3) Edit the nginx.conf to contain the following (replacing the IP with the public
IP of the frontend ec2)
location / {
proxy_pass http://63.72.210.32;
}
4) Run the setup.bash script (using chmod +x if necessary)
5) Access the public IP of the reverse proxy EC2 via a browser
