This Docker container contains a variety of networking, TLS tools, and utilities that can help with container diagnostics and troubleshooting. This guide explains how to use each tool inside the container using the docker exec command.

# Prerequisites
Before using the tools inside the container, ensure that your container is up and running. You can check the running containers with the following command:

```bash
 docker ps  
``` 



# Tools Available in the Container
 The container has the following tools installed for debugging and troubleshooting:

# Network Tools (e.g., ping, curl, wget, nslookup, telnet, netcat)
# Traffic Analysis (e.g., tcpdump, mtr, nmap)
# LS and Certificates (e.g., openssl, ca-certificates)
# Using Debugging Tools with docker exec

You can use the docker exec command to run tools inside the container. Below are examples of using each tool. 

# 1. ping
The ping command checks the connectivity to a remote host.

 
```bash
docker exec ubuntu-debug-tools ping -c 4 google.com '

#This will send 4 ICMP Echo requests (-c 4) to google.com to check connectivity.
```
# 2. curl
The curl command transfers data from or to a server using various protocols.


```bash
docker exec ubuntu-debug-tools curl -I http://example.com
#This command will send a HEAD request to http://example.com and show the response headers.
```
# 3. wget
The wget command downloads files from the web.


```bash
docker exec ubuntu-debug-tools wget https://example.com/file.txt
#This will download the file file.txt from example.com.
```

# 4. nslookup (from dnsutils)
The nslookup command queries DNS for information about domain names.

```bash
docker exec ubuntu-debug-tools nslookup google.com
#This will query the DNS for google.com and return its IP address.
```
# 5. netstat (from net-tools)
#The netstat command displays network connections and listening ports.

```bash
docker exec ubuntu-debug-tools netstat -tuln
#This will show active listening ports (-tuln) in the container.
```
# 6. iptables
The iptables command configures the firewall rules.

```bash
docker exec ubuntu-debug-tools iptables -L
#This will list all the current firewall rules in the container.
```
# 7. tcpdump
The tcpdump command captures and analyzes network packets.

```bash
docker exec -it ubuntu-debug-tools tcpdump -i eth0 -n
#This will start capturing network traffic on the eth0 interface. Press Ctrl+C to stop the capture.
```
# 8. mtr
The mtr command combines ping and traceroute to show the path and latency of network packets.

```bash
docker exec ubuntu-debug-tools mtr google.com
#This will show the route and latency to google.com.
```
# 9. telnet
The telnet command connects to a remote service using the Telnet protocol.

```bash
docker exec ubuntu-debug-tools telnet example.com 80
#This will attempt to connect to port 80 (HTTP) on example.com.
```
# 10. netcat (or nc)
The netcat command is used to read and write data across network connections.

```bash
docker exec ubuntu-debug-tools nc -zv google.com 80-443
#This will scan ports 80-443 on google.com to see if they are open.
```
# 11. nmap
The nmap command is used for network discovery and security auditing.

```bash
docker exec ubuntu-debug-tools nmap -sP 192.168.0.0/24
#This will perform a ping scan (-sP) on the IP range 192.168.0.0/24 to discover active hosts.
```
# 12. iptables
You can also use iptables to list all firewall rules.

```bash
docker exec ubuntu-debug-tools iptables -S
#This will show the rules in the iptables configuration.
```
# 13. traceroute
The traceroute command shows the path packets take to reach a destination.

```bash
docker exec ubuntu-debug-tools traceroute google.com
#This will show the route packets take to google.com.
```
# 14. openssl
The openssl command is used to test SSL/TLS connections.

```bash
docker exec ubuntu-debug-tools openssl s_client -connect google.com:443
#This will establish an SSL connection to google.com on port 443 and display the handshake details.
```
# 15. ca-certificates
Update the container's CA certificates to ensure that the container can trust the SSL/TLS certificates of other services.

```bash
docker exec ubuntu-debug-tools update-ca-certificates
#This will update the CA certificates inside the container.
```

# Running Interactive Commands
If a command requires interactive input, such as opening a bash shell, use the -it flag to start an interactive session:

```bash
docker exec -it ubuntu-debug-tools bash
#This will open an interactive bash shell inside the container.
```
# Example Use Case
Here’s an example troubleshooting workflow:

Check if DNS is resolving correctly:
```bash
docker exec ubuntu-debug-tools nslookup google.com
#Check the routing path to google.com:

```
```bash

docker exec ubuntu-debug-tools traceroute google.com
#Check if we can reach google.com via ping:

```
```bash

docker exec ubuntu-debug-tools ping -c 4 google.com
#Scan open ports on google.com:
```

```bash
docker exec ubuntu-debug-tools nc -zv google.com 80-443
#These commands will help you diagnose network issues within the container.
```
