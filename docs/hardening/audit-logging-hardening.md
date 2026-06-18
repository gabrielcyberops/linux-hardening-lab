# Audit & Logging Hardening

## 1. Objetivo

Verificar que Ubuntu Server registre correctamente los eventos relevantes del sistema mediante `systemd-journald`, permitiendo auditar actividades administrativas y validar que los controles implementados generan evidencia útil para tareas de operación e investigación.

---

## 2. Riesgo identificado

Un servidor correctamente endurecido pierde gran parte de su valor si las acciones críticas no quedan registradas.

La ausencia de registros dificulta detectar incidentes, reconstruir eventos y auditar el uso de privilegios administrativos durante tareas de operación o respuesta ante incidentes.

---

## 3. Estado inicial

### Auditoría realizada

Antes de analizar eventos específicos se verificó que el sistema estuviera generando registros mediante el servicio nativo de `systemd-journald`.

### Comandos ejecutados

```bash
journalctl -n 20
```

```bash
journalctl -u ssh -n 20
```

### Resultado observado

La auditoría confirmó que:

* El sistema estaba generando registros correctamente.
* El servicio SSH almacenaba eventos dentro del journal.
* Existía información suficiente para comenzar la revisión de eventos relacionados con seguridad.

---

## 4. Implementación

Como parte del proceso de validación se aplicó un filtrado de registros para revisar específicamente las operaciones realizadas mediante `sudo`.

### Comando ejecutado

```bash
journalctl | grep sudo
```

El filtrado permitió aislar únicamente los eventos relacionados con la elevación de privilegios, descartando información no relevante para el análisis.

---

## 5. Validación

La revisión de los registros permitió confirmar que el sistema almacenó correctamente las acciones administrativas realizadas durante el laboratorio.

Entre los eventos observados se encontraron registros correspondientes a:

* Creación del usuario administrativo secundario.
* Modificación de pertenencia al grupo `sudo`.
* Ejecución de comandos privilegiados mediante `sudo`.

Estas evidencias demostraron que las operaciones administrativas quedaron registradas junto con el usuario que las ejecutó y el comando utilizado.

---

## 6. Resultado final

Se validó correctamente el funcionamiento del sistema de registros de Ubuntu Server mediante `systemd-journald`.

Los controles implementados durante el laboratorio generan evidencia suficiente para:

* Auditar actividades administrativas.
* Revisar eventos relacionados con SSH.
* Verificar el uso de privilegios mediante `sudo`.
* Facilitar tareas básicas de investigación y trazabilidad.

---

## 7. Conclusión

La revisión de registros permitió comprobar que los controles implementados a lo largo del laboratorio generan evidencia verificable dentro del sistema.

La utilización de `journalctl` facilita la consulta de eventos relevantes sin acceder directamente a archivos de log, proporcionando una forma centralizada de auditoría sobre servicios y acciones administrativas.

Este control complementa los módulos anteriores al aportar capacidad de trazabilidad sobre los cambios realizados durante el proceso de hardening.
