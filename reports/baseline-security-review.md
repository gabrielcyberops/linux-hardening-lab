# Baseline Security Review

## 1. Objetivo

El objetivo de esta revisión inicial es identificar la configuración base del sistema antes de implementar controles de hardening.

La información recopilada servirá como punto de comparación para validar las mejoras de seguridad aplicadas durante el proyecto.

---

## 2. Identificación del Sistema

### Hostname

Comando ejecutado:

```bash
hostnamectl
```

Resultado relevante:

```text
Static hostname: gabriel-srv-01
Operating System: Ubuntu Server 24.04 LTS
Virtualization: vmware
Architecture: x86-64
```

### Análisis

* El servidor utiliza Ubuntu Server 24.04 LTS.
* El sistema se encuentra virtualizado sobre VMware.
* El hostname configurado es `gabriel-srv-01`.
* No se identifican problemas de configuración en esta etapa.

---

## 3. Estado Inicial de SSH

Comando ejecutado:

```bash
systemctl status ssh
```

Resultado relevante:

```text
ssh.service - OpenBSD Secure Shell server

Loaded: loaded
disabled
preset: enabled
```

### Análisis

* OpenSSH Server se encuentra instalado.
* El servicio fue detectado correctamente por systemd.
* Se realizará una revisión detallada de la configuración durante la fase de hardening.
* El acceso remoto mediante SSH constituye uno de los principales puntos de exposición del servidor y será evaluado posteriormente.


## 4. Servicios Expuestos en Red

### Comando ejecutado

```bash
sudo ss -tulnp
```

### Observaciones

Se identificaron servicios escuchando mediante protocolos TCP y UDP.

Estados observados:

```text
UNCONN
LISTEN
```

Servicios relevantes detectados:

```text
22/TCP
53/TCP
53/UDP
```

### Análisis

* El puerto 22/TCP corresponde al servicio OpenSSH utilizado para administración remota.
* El puerto 53/TCP y 53/UDP corresponde al servicio de resolución DNS local del sistema.
* No se detectaron servicios adicionales expuestos durante la revisión inicial.
* Las colas de recepción y envío se encontraban en estado normal sin tráfico pendiente.
* La superficie de ataque inicial del servidor es reducida y se encuentra alineada con una instalación base de Ubuntu Server.

### Conclusión

La revisión inicial no evidencia servicios innecesarios expuestos a la red. El principal punto de acceso administrativo identificado es OpenSSH, el cual será objeto de endurecimiento durante las siguientes fases del proyecto.



## 5. Estado Inicial del Firewall

### Comando ejecutado

```bash
sudo ufw status verbose
```

### Resultado

```text
Status: inactive
```

### Análisis

* UFW (Uncomplicated Firewall) se encuentra instalado pero no activo.
* Actualmente el sistema no aplica reglas de filtrado mediante UFW.
* La exposición de servicios depende únicamente de la configuración de cada servicio y de los controles de red externos al servidor.
* La activación y configuración del firewall será realizada durante la fase de hardening.

### Riesgo Identificado

La ausencia de reglas activas de firewall puede permitir la exposición innecesaria de servicios si se instalan nuevas aplicaciones o servicios de red en el sistema.

### Acción Planificada

Implementar una política de filtrado restrictiva basada en el principio de mínimo acceso necesario.

