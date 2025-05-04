# Monitoring with Docker Compose using InfluxDB, Telegraf and Grafana

This repository contains a Docker Compose setup for creating containers for InfluxDB, Telegraf, and Grafana, providing a comprehensive monitoring solution. It was forked from https://github.com/jersonmartinez/docker-compose-influxdb-telegraf-grafana and adjusted to make it work for personal usage in MacOS via Docker.

## Infrastructure Model

![Infrastructure Model](https://github.com/user-attachments/assets/cbac355d-2c26-469b-a953-650b083a7eda)

## Quick Start

### Clone the Repository

```bash
git clone https://github.com/gmusliaj/docker-compose-influxdb-telegraf-grafana.git
cd docker-compose-influxdb-telegraf-grafana
```

### Deploy the Stack

```bash
docker-compose up -d
```

![Deployment Output](/docs/dashboard.png)

## Detailed Setup Guide

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jersonmartinez/docker-compose-influxdb-telegraf-grafana.git
   cd docker-compose-influxdb-telegraf-grafana
   ```

2. **Start the Services**:
   ```bash
   docker-compose up -d
   ```

3. **Verify the Services**:
   ```bash
   docker-compose ps
   ```

4. **Access Grafana**:
   - Open your browser and navigate to `http://localhost:3000`
   - Default credentials: username and password are both `admin`

## Using the Repository

### Configuring Telegraf

- Telegraf configuration files are located in the `telegraf` directory.
- After modifying the configuration files, restart the Telegraf container:
  ```bash
  docker-compose restart telegraf
  ```

### Viewing Metrics in Grafana

1. Open Grafana and add InfluxDB as a data source.
2. Create dashboards and panels to visualize the metrics collected by Telegraf.

### Triggering Cron Job Error in Logs

You can trigger a Cron Job Error in the Log files by running the following script locally:

```bash
./trigger-cron-error-log.sh
```

After running the script above in the Telegraf container will be generated the following logs:

```bash
root@53c892ae73fe:/# cat /var/log/syslog
May 04 21:57:56 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:57:56 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:22 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:22 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:23 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:23 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:24 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:24 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:25 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:25 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:26 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:26 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:27 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:27 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:27 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:27 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
May 04 21:58:28 myhost CRON[12346]: (root) CMD (my-script.sh 2>&1 | logger)
May 04 21:58:28 myhost my-script.sh[12347]: ERROR: Unable to connect to DB
```

This is a simple usecase which shows when there is an `ERROR` in the /var/sys/logs and gets sent to InfluxDB and then visualized in Grafana Dashboard. You can configure this behavior anytime under `telegraf/telegraf.conf`


## Service Descriptions

1. **InfluxDB**: A time-series database designed for high write and query loads, used to store metrics collected by Telegraf.

2. **Telegraf**: An agent for collecting, processing, aggregating, and writing metrics. It gathers data from the host and Docker containers, sending it to InfluxDB.

3. **Grafana**: A web-based interface for visualizing metrics stored in InfluxDB, allowing creation of dashboards and panels for monitoring.

4. **Nginx**: A web server providing static content serving and request proxying capabilities.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.