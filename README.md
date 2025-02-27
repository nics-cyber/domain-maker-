# LonelyDNS

**LonelyDNS** is a custom DNS server that allows you to create your own private or public domain extensions, such as `.lonely`, `.custom`, or any other TLD. It uses **BIND9** to manage domain names and resolve them locally or across the internet if properly configured.

---

## 🚀 Features
- ✅ Create **custom domain extensions** (e.g., `.lonely`, `.yourname`)
- ✅ Private DNS server for internal networks
- ✅ Public DNS option (requires VPS & domain delegation)
- ✅ Automatic BIND9 installation and configuration
- ✅ Supports multiple domains

---

## 📥 Installation
### **Step 1: Download the Script**
```bash
wget https://your-download-link.com/setup_dns.sh -O setup_dns.sh
chmod +x setup_dns.sh
```

### **Step 2: Run the Script**
```bash
sudo ./setup_dns.sh
```

### **Step 3: Enter Required Details**
- Custom domain (e.g., `lonely`)
- Your DNS server’s IP
- Web server IP for `www.domain`

---

## 🛠️ Usage
### **Setting Up Your System to Use LonelyDNS**
1. **Set Your DNS Server**:
   - Go to **Network Settings** on your PC.
   - Change the **DNS Server** to your LonelyDNS IP.
   - Apply changes and restart networking.

2. **Test Your Custom Domain**:
```bash
ping www.yourcustomdomain
```

If configured correctly, it should resolve to the provided web server IP.

---

## 🌍 Making It Public (Optional)
To allow anyone on the internet to resolve your `.lonely` domain:
1. **Use a Public VPS** and install LonelyDNS.
2. **Register a Nameserver** with a domain registrar.
3. **Set NS Records** for `.lonely` to your VPS IP.

---

## 🛑 Uninstall LonelyDNS
```bash
sudo apt remove --purge bind9 bind9utils bind9-doc -y
sudo rm -rf /etc/bind
```

---

## 📜 License
This project is **open-source**. Feel free to modify and improve!

---

## ✉️ Support
For issues or feature requests, contact **your-email@example.com** or open a GitHub issue.

---

Enjoy using **LonelyDNS** to create your own custom domain extensions! 🚀

