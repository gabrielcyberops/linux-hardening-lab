# Final Hardening Report

## 1. Objetivo

Este reporte resume el estado final del laboratorio una vez implementados y validados los controles de hardening sobre Ubuntu Server 24.04 LTS.

Su propósito es consolidar los resultados obtenidos y verificar que las medidas de seguridad implementadas cumplen con los objetivos definidos al inicio del proyecto.

---

## 2. Resumen de Controles Implementados

Durante el laboratorio se implementaron los siguientes controles:

| Control                             |     Estado     |
| ----------------------------------- | :------------: |
| SSH Hardening                       | ✅ Implementado |
| UFW Firewall                        | ✅ Implementado |
| Fail2Ban                            | ✅ Implementado |
| Gestión de Usuarios y Privilegios   | ✅ Implementado |
| Auditoría mediante systemd-journald | ✅ Implementado |
| Validación técnica                  |  ✅ Completada  |

---

## 3. Resultados Obtenidos

Al finalizar el laboratorio se verificó que:

* El acceso remoto mediante SSH utiliza una configuración endurecida.
* El acceso directo del usuario root se encuentra deshabilitado.
* La autenticación por contraseña fue deshabilitada en favor de autenticación mediante claves públicas.
* El firewall UFW aplica una política restrictiva permitiendo únicamente los servicios autorizados.
* Fail2Ban protege el servicio SSH frente a intentos repetidos de autenticación.
* La administración de privilegios se realiza mediante un usuario dedicado perteneciente al grupo `sudo`.
* Las acciones administrativas y eventos relevantes quedan registrados mediante `systemd-journald`.

---

## 4. Validaciones Realizadas

La implementación fue verificada mediante:

* Revisión de configuraciones.
* Validación funcional de servicios.
* Comprobación del estado de los controles implementados.
* Auditoría de registros del sistema.
* Ejecución del script `validate-hardening.sh`.

---

## 5. Resultado Final

El laboratorio finaliza con un servidor Ubuntu Server 24.04 LTS configurado con controles básicos de hardening orientados a reducir la superficie de ataque, fortalecer el acceso administrativo y mejorar la capacidad de auditoría del sistema.

Cada control implementado fue documentado y validado utilizando herramientas nativas del sistema operativo.

---

## 6. Conclusión

Este proyecto permitió aplicar y documentar un conjunto de controles fundamentales de seguridad sobre Linux siguiendo un proceso estructurado de implementación, validación y documentación.

Además de fortalecer la configuración del sistema, el laboratorio sirvió como ejercicio práctico de administración segura y generación de evidencia técnica, proporcionando una base sólida para proyectos posteriores orientados a seguridad defensiva e infraestructura.
