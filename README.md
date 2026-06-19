# Linux Hardening Lab - Ubuntu Server 24.04 LTS

## Descripción

Este laboratorio documenta la implementación y validación de controles de hardening sobre **Ubuntu Server 24.04 LTS**, aplicando buenas prácticas de administración segura utilizadas en entornos Linux.

El proyecto se centra en reducir la superficie de ataque del servidor, fortalecer los mecanismos de acceso, proteger servicios expuestos y validar técnicamente cada control implementado mediante procedimientos reproducibles y evidencia documental.

Cada módulo sigue un flujo de trabajo consistente basado en:

1. Identificación del riesgo.
2. Auditoría del estado inicial.
3. Implementación del control.
4. Validación técnica.
5. Documentación de resultados.

---

## Objetivos

- Reducir la superficie de ataque del servidor.
- Fortalecer el acceso remoto mediante OpenSSH.
- Implementar protección contra ataques automatizados.
- Aplicar el principio de mínimo privilegio en la administración de usuarios.
- Mejorar la capacidad de auditoría mediante registros del sistema.
- Documentar cada implementación de forma reproducible.

---

## Tecnologías Utilizadas

| Componente | Tecnología |
|------------|------------|
| Sistema Operativo | Ubuntu Server 24.04 LTS |
| Acceso Remoto | OpenSSH |
| Firewall | UFW |
| Protección contra fuerza bruta | Fail2Ban |
| Gestión de usuarios | sudo |
| Auditoría | systemd-journald |

---

## Controles Implementados

- SSH Hardening
- Configuración de UFW
- Implementación de Fail2Ban
- Gestión segura de usuarios y privilegios
- Auditoría y revisión de registros
- Validación técnica de controles

---

## Flujo de Seguridad

El siguiente diagrama resume cómo interactúan los controles implementados durante el laboratorio.

```text
                    Cliente Remoto
                          │
                          ▼
                 ┌─────────────────┐
                 │   Firewall UFW  │
                 │ Política: Deny  │
                 └────────┬────────┘
                          │
                  Permite TCP/22
                          │
                          ▼
                 ┌─────────────────┐
                 │  Servidor SSH   │
                 └────────┬────────┘
                          │
          Intentos fallidos de acceso
                          ▼
                 ┌─────────────────┐
                 │    Fail2Ban     │
                 │ Bloqueo temporal│
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Ubuntu Server   │
                 │ 24.04 LTS       │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ systemd-journald│
                 │ Auditoría Logs  │
                 └─────────────────┘
```

---

## Estructura del Repositorio

```text
linux-hardening-lab/
│
├── configs/
│   ├── ssh/
│   └── fail2ban/
│
├── docs/
│   └── hardening/
│
├── reports/
│
├── scripts/
│   └── validate-hardening.sh
│
└── README.md
```

## Descripción

**configs/**

Configuraciones endurecidas utilizadas durante el laboratorio.

**docs/**

Documentación técnica de cada control implementado.

**reports/**

Reportes de evaluación inicial y resultados finales del laboratorio.

**scripts/**

Scripts de validación utilizados para comprobar el estado de los controles implementados.
---

## Metodología de Implementación

Cada módulo del laboratorio sigue el mismo proceso de trabajo:

- Identificación del riesgo.
- Auditoría inicial.
- Implementación del control.
- Validación funcional.
- Documentación técnica.

Este enfoque busca reproducir una metodología similar a la utilizada durante tareas de administración e infraestructura en entornos Linux.

---

## Validación

Los controles implementados fueron verificados mediante:

- Revisión de configuración.
- Validación funcional.
- Comprobación de servicios.
- Auditoría mediante registros del sistema.
- Evidencia documental.

---

## Perfil Profesional

Este laboratorio forma parte de un portfolio orientado a:

- Blue Team
- Security Operations Center (SOC)
- Linux System Administration
- Infrastructure Security
- Identity & Access Management (IAM)

Su propósito es demostrar la implementación práctica de controles básicos de hardening y su correspondiente proceso de validación, priorizando una documentación clara, reproducible y alineada con buenas prácticas de administración de sistemas Linux.