# vpn-pack

  

Fully configured VPN server with secure letsencrypt certificates. Safety way [manage your VPN](https://github.com/ngoduykhanh/wireguard-ui) config remotely.
If you would like to run VPN **simple** and **quick**, just clone this repo and run compose file:
 
```
# edit .env file with your domain name and email value before up compose
docker compose up -d
```

It will run compose with default configuration of network and vpn server. 
> receiving certificates may take 1-2 min

Open link *https://your_domain.name*
login: admin 
pass: admin
> do not forget to change it after first login

If something doesn't work, check applications logs for some errors:
```
docker compose logs -f
```

### Features
- VPN configuration management for multiple clients (friends and family)
- only 2 ports in your firewall, 1 for https 1 for VPN clients
- free letsencrypt certificate receiving and renewal automatically
> manage your config from whatever you want with secure https connection 
- minimal resource required  (1cpu/100 mb ram)
> you can use lower priced VPS/VDS servers

### Requirements

- host machine with static public IP
- domain name with DNS A record with host machine IP
- docker && docker compose
- opened ports in your firewall 443/tcp 51820/udp
  
### Next features

- [ ] support [pi-hole dns](https://pi-hole.net/)
- [ ] binary installer
- [ ] support [easy-wireguard ](https://github.com/WeeJeWel/wg-easy)
- [ ] manage VPN via telegram bot
- [ ] manage multiple VPN interfaces
  

Suggest you feature! Open Issue.

If you have question, just open issue with it or write me in Twitter: [dgovorukhin](https://twitter.com/dgovorukhin) or email: dmitriy.govorukhin@gmail.com.
Together we will do it better.

Feel free to contribute!