# UFW Hardening

## 1. Objetivo

Reducir la superficie de ataque del servidor mediante la implementación de una política de filtrado de red basada en el principio de mínimo acceso necesario.

---

## 2. Riesgo Identificado

Durante la revisión inicial se identificó que:

* UFW se encontraba instalado pero deshabilitado.
* El sistema no aplicaba reglas locales de filtrado de tráfico.
* La exposición de servicios dependía únicamente de la configuración individual de cada servicio.

---

## 3. Controles Planificados

* Establecer una política por defecto restrictiva.
* Permitir únicamente los servicios necesarios.
* Mantener acceso administrativo mediante SSH.
* Validar el estado operativo del firewall tras la implementación.

---


## 4. Implementación

### Políticas por Defecto

Comandos ejecutados:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Objetivo

Aplicar una política restrictiva para conexiones entrantes y permitir las conexiones iniciadas por el propio servidor.

### Regla de Administración Remota

Comando ejecutado:

```bash
sudo ufw allow 22/tcp
```

### Objetivo

Mantener el acceso administrativo mediante OpenSSH mientras se restringe el resto del tráfico entrante.

---

## 5. Validación

### Estado del Firewall

Comando ejecutado:

```bash
sudo ufw status verbose
```

### Resultado relevante

```text
Status: active

Default: deny (incoming), allow (outgoing), disabled (routed)

22/tcp ALLOW IN Anywhere
22/tcp (v6) ALLOW IN Anywhere (v6)
```

### Análisis

* UFW se encuentra habilitado y operativo.
* La política por defecto bloquea conexiones entrantes no autorizadas.
* Las conexiones salientes permanecen permitidas.
* El acceso administrativo mediante SSH permanece habilitado en el puerto 22/TCP.
* No se identifican reglas adicionales de exposición de servicios.

---

## 6. Resultado Final

Controles implementados:

```text
Default Incoming Policy : DENY
Default Outgoing Policy : ALLOW
SSH (22/TCP)            : ALLOW
```

Beneficios obtenidos:

* Reducción de la superficie de ataque expuesta a la red.
* Aplicación del principio de mínimo acceso necesario.
* Protección frente a conexiones entrantes no autorizadas.
* Conservación del acceso remoto administrativo mediante SSH.

---

## 7. Conclusión

La implementación inicial de UFW fue completada satisfactoriamente.

El servidor adopta una política de denegación por defecto para tráfico entrante, permitiendo únicamente el servicio OpenSSH requerido para administración remota.

La configuración reduce la exposición de servicios innecesarios y constituye una base adecuada para futuras capas de hardening.