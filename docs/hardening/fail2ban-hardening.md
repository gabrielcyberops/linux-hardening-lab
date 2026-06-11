# Fail2Ban Hardening

## 1. Objetivo

Implementar un mecanismo de protección frente a intentos repetidos de autenticación fallida en servicios expuestos, reduciendo el riesgo de ataques automatizados contra OpenSSH.

---

## 2. Riesgo Identificado

Durante la revisión inicial se identificó que:

* El servidor no contaba con mecanismos automáticos de bloqueo frente a intentos reiterados de autenticación fallida.
* El servicio OpenSSH se encontraba expuesto para administración remota.
* Los intentos de acceso maliciosos podrían generar actividad innecesaria sobre el servicio y los registros de auditoría.

---

## 3. Estado Inicial

### Comandos ejecutados

```bash
sudo systemctl status fail2ban
fail2ban-client -V
```

### Resultado

```text
Unit fail2ban.service could not be found.
Command 'fail2ban-client' not found
```

### Análisis

* Fail2Ban no se encontraba instalado en el sistema.
* No existían mecanismos de mitigación automática frente a intentos repetidos de autenticación fallida sobre los servicios monitoreados.

---

## 4. Implementación

### Instalación del Servicio

Comandos ejecutados:

```bash
sudo apt update
sudo apt install fail2ban -y
```

### Configuración Modular

Para mantener una configuración independiente de los archivos por defecto del sistema se creó un archivo de configuración local.

Comando ejecutado:

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

### Configuración Aplicada

Archivo configurado:

```text
/etc/fail2ban/jail.local
```

Directivas aplicadas:

```text
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 3
banaction = ufw

[sshd]
enabled = true
```

### Justificación

* Reducir la cantidad de intentos fallidos permitidos.
* Incrementar el tiempo de bloqueo para orígenes sospechosos.
* Integrar los bloqueos con UFW.
* Mantener la protección activa sobre OpenSSH.
* Utilizar una configuración modular que facilite futuras tareas de mantenimiento.

---

## 5. Validación

### Estado del Servicio

Comando ejecutado:

```bash
sudo systemctl status fail2ban
```

### Resultado relevante

```text
Loaded: loaded
enabled
Active: active (running)
Status: Server ready
```

### Análisis

* Fail2Ban se encuentra instalado correctamente.
* El servicio está activo y operativo.
* La unidad de systemd se encuentra habilitada para iniciar automáticamente junto al sistema.
* El motor de monitoreo se encuentra preparado para procesar eventos de seguridad.

---

### Verificación de Jails Activas

Comando ejecutado:

```bash
sudo fail2ban-client status
```

### Resultado relevante

```text
Status
|- Number of jail: 1
`- Jail list: sshd
```

### Análisis

* Se detectó una jail activa asociada a OpenSSH.
* Fail2Ban se encuentra monitoreando eventos relacionados con autenticación SSH.

---

### Verificación de la Jail SSH

Comando ejecutado:

```bash
sudo fail2ban-client status sshd
```

### Resultado relevante

```text
Currently failed: 0
Total failed: 0
Currently banned: 0
Total banned: 0
```

### Análisis

* No se registraron intentos fallidos durante la validación.
* No existen direcciones IP bloqueadas actualmente.
* La jail de OpenSSH se encuentra cargada y operativa.

---

### Verificación de Parámetros Aplicados

Comandos ejecutados:

```bash
sudo fail2ban-client get sshd maxretry
sudo fail2ban-client get sshd bantime
sudo fail2ban-client get sshd findtime
```

### Resultado relevante

```text
3
3600
600
```

### Análisis

* El número máximo de intentos fallidos fue reducido a 3.
* El tiempo de bloqueo fue establecido en 3600 segundos (1 hora).
* La ventana de detección se mantiene en 600 segundos (10 minutos).
* Los parámetros configurados fueron cargados correctamente por el servicio.

---

## 6. Resultado Final

Controles implementados:

```text
Fail2Ban instalado
Servicio activo
Inicio automático habilitado
Jail SSHD operativa
MaxRetry: 3
BanTime: 1 hora
FindTime: 10 minutos
BanAction: UFW
```

Beneficios obtenidos:

* Monitoreo automático de eventos de autenticación.
* Detección de intentos repetidos de acceso fallido.
* Bloqueo temporal de orígenes sospechosos.
* Integración con UFW para aplicar restricciones de acceso.
* Reducción de exposición frente a ataques automatizados.

---

## 7. Conclusión

La implementación de Fail2Ban fue completada satisfactoriamente.

Además de la instalación y activación del servicio, se aplicó una configuración modular mediante `jail.local` para endurecer la protección del servicio OpenSSH.

El sistema se encuentra configurado para detectar intentos repetidos de autenticación fallida y aplicar bloqueos temporales mediante UFW, agregando una capa adicional de protección al acceso remoto del servidor.
