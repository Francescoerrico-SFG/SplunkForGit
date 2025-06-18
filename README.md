
# Splunk Distributed Setup with Git in Docker

Questo progetto esegue un'istanza **Splunk distribuita** in ambiente Docker, con i seguenti ruoli:

- **Indexer (IDX)** – Elabora ed indicizza i dati ricevuti.
- **Heavy Forwarder (HF)** – Inoltra dati verso l'indexer.
- **Search Head (SH)** – Consente di cercare e visualizzare i dati.

*Su ogni Macchina è installato Git 

## 📁 Struttura del progetto

```
.
├── docker-compose.yml
├── Dockerfile                  # per installazioni extra, es. git
├── configs/
│   ├── heavyforwarder/
│   │   └── local/
│   │       └── outputs.conf
│   └── searchhead/
│       └── local/
│           ├── distsearch.conf
```

## 🚀 Come avviare l’ambiente

1. **Clona il repository**
   ```bash
   git clone <repo-url>
   cd <repo-name>
   ```

2. **(Opzionale) Pulisci i volumi precedenti**
   Se hai già avviato i container in passato, rimuovi i volumi per evitare errori di autenticazione:
   ```bash
   docker volume rm splunk_indexer_var splunk_hf_var splunk_sh_var
   ```

3. **Avvia i container**
   ```bash
   docker compose up -d --build
   ```

4. **Accedi all’interfaccia Splunk**
   - Search Head: [http://localhost:8000](http://localhost:8000)
   - Username: `admin`
   - Password: impostata da `SPLUNK_PASSWORD` nel docker-compose ( `Splunk@00`)

---

## 🔍 Verifica della connessione con l’Indexer

Dal Search Head:

1. Vai su **Settings → Distributed Search → Search peers**
2. Dovresti vedere il peer `idx:8089` con status **Up**
3. Se lo vedi come **Down** con errore:

   ```
   Authentication credentials rejected by peer
   ```

   allora l'autenticazione è fallita. 
   
   Per risolvere clicca sul nome e inserisci manualmente:
   Username: admin
   Password: Splunk@00

---


## 🛑 Per fermare tutto

```bash
docker compose down
```

---

## 🧹 Reset completo (attenzione: perderai i dati!)

```bash
docker compose down -v
docker volume rm splunk_indexer_var splunk_hf_var splunk_sh_var
```

---

