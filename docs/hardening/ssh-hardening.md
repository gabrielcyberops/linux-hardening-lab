# SSH Hardening

## 1. Objetivo

Reducir la superficie de ataque del servicio OpenSSH mediante la aplicación de controles de autenticación y acceso remoto.

---

## 2. Riesgo Identificado

Durante la revisión inicial se identificó que:

* OpenSSH se encuentra habilitado en el puerto 22/TCP.
* Algunas directivas críticas utilizan valores por defecto.
* La autenticación por contraseña puede representar un riesgo frente a ataques de fuerza bruta.
* El acceso directo a cuentas privilegiadas debe ser restringido.

---

## 3. Configuración Actual

### Directivas auditadas

```bash
PermitRootLogin
PasswordAuthentication
PubkeyAuthentication
```

### Resultado

```text
PermitRootLogin -> comentado
PasswordAuthentication -> comentado
PubkeyAuthentication -> comentado
```

### Análisis

Las tres directivas se encontraban comentadas dentro de la configuración por defecto de OpenSSH.

Esto implica que el servicio utiliza los valores predeterminados definidos por la implementación instalada, por lo que resulta recomendable declarar explícitamente las políticas de autenticación requeridas por la organización.

---

## 4. Controles Planificados

* Deshabilitar acceso remoto directo a la cuenta root.
* Deshabilitar autenticación mediante contraseñas.
* Mantener autenticación mediante claves públicas SSH.
* Implementar configuración modular.
* Validar sintaxis antes de aplicar cambios.
* Verificar funcionamiento del servicio tras la implementación.

---

## 5. Backup de Configuración

Antes de aplicar modificaciones se realizó una copia de seguridad de la configuración original.

### Comando ejecutado

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

### Validación

```bash
ls -l /etc/ssh/sshd_config*
```

### Resultado

```text
/etc/ssh/sshd_config
/etc/ssh/sshd_config.bak
```

### Justificación

La copia de seguridad permite restaurar rápidamente la configuración original en caso de errores durante el proceso de hardening.

### Rollback

```bash
sudo cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config
```

---

## 6. Implementación Inicial

Se creó un archivo de configuración modular para aplicar controles de hardening sin modificar directamente la configuración principal del servicio.

### Archivo creado

```text
/etc/ssh/sshd_config.d/99-enterprise-hardening.conf
```

### Directivas aplicadas

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

### Justificación

* Bloquear el acceso remoto directo a la cuenta root.
* Eliminar la autenticación basada en contraseñas.
* Mantener autenticación mediante claves públicas SSH.
* Centralizar los controles de hardening en un archivo independiente y fácilmente auditable.
* Facilitar futuras tareas de mantenimiento y revisión.

---

## 7. Validación

### Validación de Sintaxis

Comando ejecutado:

```bash
sudo sshd -t
```

### Análisis

La validación de sintaxis no identificó errores en las directivas configuradas.

Durante las pruebas se observó un comportamiento relacionado con el entorno de ejecución temporal de OpenSSH, el cual no afectó el funcionamiento normal del servicio.

No se detectaron errores de sintaxis asociados a las directivas configuradas en el archivo de hardening.

---

### Verificación del Servicio

Comando ejecutado:

```bash
sudo systemctl status ssh
```

### Resultado relevante

```text
active (running)
```

### Análisis

* El servicio OpenSSH se encuentra operativo.
* Las modificaciones realizadas no impidieron el inicio del servicio.
* El servidor continúa aceptando conexiones SSH.

---

### Verificación de Escucha de Red

Comando ejecutado:

```bash
sudo ss -tulnp | grep :22
```

### Resultado relevante

```text
LISTEN 0.0.0.0:22
LISTEN [::]:22
```

### Análisis

* OpenSSH continúa escuchando correctamente en el puerto 22/TCP.
* La aplicación del hardening no afectó la disponibilidad del servicio.
* El acceso remoto continúa disponible para usuarios autorizados.

---

### Verificación de Configuración Aplicada

Comando ejecutado:

```bash
sudo cat /etc/ssh/sshd_config.d/99-enterprise-hardening.conf
```

### Resultado relevante

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

### Análisis

Las directivas de hardening fueron almacenadas correctamente dentro del archivo modular configurado para OpenSSH.

---

### Verificación del Entorno de Ejecución

Comando ejecutado:

```bash
ls -ld /run/sshd
```

### Resultado relevante

```text
drwxr-xr-x root root /run/sshd
```

### Análisis

* El directorio requerido por OpenSSH existe correctamente.
* El entorno de ejecución necesario para el servicio fue generado por el sistema.

---

## 8. Resultado Final

Se implementó una configuración modular de hardening mediante:

```text
/etc/ssh/sshd_config.d/99-enterprise-hardening.conf
```

Controles aplicados:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

Beneficios obtenidos:

* Se eliminó el acceso remoto directo a la cuenta root.
* Se deshabilitó la autenticación mediante contraseñas.
* Se mantuvo la autenticación mediante claves públicas SSH.
* Se adoptó una configuración modular alineada con las buenas prácticas de administración en Ubuntu Server.

---

## 9. Conclusión

La implementación inicial de hardening fue completada satisfactoriamente.

Se aplicaron controles de autenticación más restrictivos mediante una configuración modular, manteniendo la disponibilidad del servicio y reduciendo la superficie de ataque asociada al acceso remoto.

OpenSSH continúa operativo, escuchando en el puerto 22/TCP y utilizando una política de autenticación basada en claves públicas, alineada con prácticas recomendadas de administración segura en entornos Linux.
