# Linux Hardening Lab - Ubuntu Server 24.04 LTS

## 1. Descripción General

Este repositorio documenta la implementación y validación de controles de hardening sobre Ubuntu Server 24.04 LTS, siguiendo buenas prácticas de administración segura y reducción de superficie de ataque utilizadas en entornos empresariales.

El laboratorio fue diseñado con foco en seguridad defensiva, administración de sistemas Linux y documentación técnica orientada a operaciones e infraestructura.

Cada control implementado incluye su justificación técnica, riesgo mitigado, impacto operativo y procedimiento de validación.

---

## 2. Objetivos del Proyecto

Los objetivos principales de este laboratorio son:

* Reducir la superficie de ataque del sistema.
* Fortalecer los mecanismos de acceso remoto.
* Implementar controles de protección frente a ataques automatizados.
* Mejorar la visibilidad y capacidad de auditoría del sistema.
* Documentar controles de seguridad de forma reproducible y profesional.

---

## 3. Alcance del Laboratorio

El proyecto contempla la implementación de los siguientes controles:

* Hardening de OpenSSH.
* Configuración de UFW (Uncomplicated Firewall).
* Implementación de Fail2Ban.
* Gestión segura de usuarios y privilegios.
* Auditoría y revisión de registros.
* Validación técnica de los controles implementados.

---

## 4. Entorno Implementado

| Componente                     | Tecnología                              |
| ------------------------------ | --------------------------------------- |
| Sistema Operativo              | Ubuntu Server 24.04 LTS                 |
| Acceso Remoto                  | OpenSSH                                 |
| Firewall                       | UFW                                     |
| Protección contra fuerza bruta | Fail2Ban                                |
| Auditoría                      | Logs del sistema y herramientas nativas |

---

## 5. Controles de Seguridad

| Control         | Objetivo                                   |
| --------------- | ------------------------------------------ |
| SSH Hardening   | Reducir riesgos asociados al acceso remoto |
| UFW             | Restringir tráfico no autorizado           |
| Fail2Ban        | Mitigar ataques automatizados              |
| User Management | Aplicar principios de mínimo privilegio    |
| Audit & Logging | Mejorar trazabilidad y monitoreo           |

---

## 6. Estructura del Repositorio

```text
linux-hardening-lab/
├── docs/
├── configs/
├── scripts/
└── reports/
```

### Descripción

* docs/: documentación técnica, decisiones de diseño y validaciones.
* configs/: configuraciones endurecidas utilizadas durante el laboratorio.
* scripts/: automatización y validaciones básicas.
* reports/: reportes de evaluación inicial y resultados finales.

---

## 7. Metodología

Cada control implementado sigue el siguiente proceso:

1. Identificación del riesgo.
2. Evaluación del impacto potencial.
3. Implementación de la mitigación.
4. Validación técnica.
5. Documentación de resultados.

---

## 8. Validación

Los controles son verificados mediante:

* Revisión de configuración.
* Validación funcional.
* Análisis de logs.
* Scripts de comprobación.
* Evidencia documental.

---

## 9. Objetivo Profesional

Este laboratorio forma parte de un portfolio orientado a:

* Blue Team
* Security Operations Center (SOC)
* Identity & Access Management (IAM)
* Linux System Administration
* Infrastructure Security

La documentación busca reflejar procesos de implementación, validación y análisis similares a los utilizados en entornos corporativos reales.
