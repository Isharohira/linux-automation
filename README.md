
# Linux Automation – Data Backups, Monitoring & Recovery Suite

This project demonstrates how **production server data** can be **automatically backed up** to a **separate backup server** and restored when needed.
It represents a **real-world Linux and DevOps automation scenario**.

---

## 🔹 What Problem Does This Project Solve?

In real-world scenarios:

* Production data can be **deleted by mistake**
* Servers can **crash**
* Data **corruption** can occur

We need:

* **Regular backups**
* **Secure data transfer**
* **Easy restore process**

---

## 🔹 Project Architecture

We use **two Linux servers**:

### **Production Server**

* Stores application and business data inside `data/` (`file1.txt`, `file2.txt`)
* Contains backup and restore scripts inside the `backup/` directory
* Manages automation, logging, and scheduling

### **Backup Server**

* Receives and stores backups securely
* Maintains **date-wise backup directories**
* Used only for backup storage and recovery

---

## 🔹 Project Flow

* The **Production Server** stores application and business data inside the `data/` directory (`file1.txt`, `file2.txt`).
* **Backup and restore scripts** (`backup.sh` and `script.sh`) are located inside the `backup/` folder and handle the complete backup and recovery process.
* Data is **securely transferred** from the Production Server to the Backup Server using **SSH**.
* Each backup is saved in **date-wise folders** on the Backup Server for easy tracking and recovery.
* **Cron** ensures that the backup script runs **automatically at a specific time every day**.
* All backup operations are **logged** in `backup/logs/backup.log` on the Production Server.
* In case of **data loss or corruption**, `script.sh` retrieves the required backup from the Backup Server and restores it on the Production Server.

---

## 🔹 Tools and Packages Used

### **Tools**

* Bash
* Rsync
* SSH
* Cron
* Logrotate

---

## 🔹 Linux Automation – Architecture & Flow Diagram

```
Production Server
┌─────────────────────────────┐
│ Linux_Automation/           │
│ ├─ data/                    │
│ │   ├─ file1.txt            │
│ │   └─ file2.txt            │
│ └─ backup/                  │
│     ├─ backup.sh            │
│     ├─ script.sh            │
│     └─ logs/                │
│         └─ backup.log       │
└─────────┬───────────────────┘
          │ (SSH + Rsync)
          ▼
Backup Server
┌─────────────────────────────┐
│ /backup/prod_backup/        │
│ ├─ 2026-01-28               │
│ ├─ 2026-01-29               │
│ └─ 2026-01-30               │
└─────────────────────────────┘

Cron Job (Production Server)
┌─────────────────────────────┐
│ backup.sh runs daily        │
│ → creates date-wise backup  │
└─────────────────────────────┘
```

---

## 🔹 Why SSH Key Generation is Done

To enable automated backups without typing passwords, an SSH key pair was generated on the Production Server.

* Provides **passwordless login** for automation
* Ensures **secure and encrypted connection**
* Allows scripts to run automatically without **manual intervention**

> The public key is copied to the Backup Server so that the Production Server can connect securely and push backups automatically.

---

## 🔹 Cron Scheduling

* The **backup script** is scheduled using **Cron**
* Runs automatically **every day at a specific time**
* Each execution creates a **new date-wise backup**
* Ensures consistent data protection without manual effort

---

## 🔹 Automation Features

* **Fully automated** backup and recovery mechanism
* Secure data transfer using **SSH + Rsync**
* **Date-wise backup management** for easy rollback
* **Centralized logging** for tracking backup operations
* **Log rotation** to prevent disk space issues

