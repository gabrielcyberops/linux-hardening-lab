# User Management Hardening

## 1. Objetivo

Implementar un esquema básico de gestión segura de usuarios y privilegios en Ubuntu Server, aplicando el Principio de Mínimo Privilegio (PoLP) mediante la creación controlada de una identidad administrativa secundaria y la validación de su acceso privilegiado.

---

## 2. Riesgo identificado

Utilizar una única cuenta administrativa para todas las tareas operativas incrementa el impacto de un posible compromiso de credenciales y dificulta la separación de responsabilidades.

Además, otorgar privilegios administrativos sin una validación previa puede generar configuraciones inseguras o usuarios con permisos excesivos.

---

## 3. Estado inicial

### Auditoría realizada

Antes de modificar la configuración se verificó:

* Configuración válida de `sudo`.
* Usuarios y grupos locales existentes.
* Integridad de la configuración de `sudo`.
* Miembros actuales del grupo administrativo.
* Creación inicial del nuevo usuario sin privilegios elevados.

### Comandos ejecutados

```bash
sudo visudo -c
getent group sudo
id secadmin
groups secadmin
sudo -l -U secadmin
```

### Resultado observado

La auditoría confirmó que:

* La configuración de `sudo` era válida.
* El nuevo usuario existía correctamente.
* El usuario no pertenecía al grupo `sudo`.
* No podía ejecutar comandos privilegiados.

Esto estableció una línea base antes de realizar cambios sobre el sistema.

---

## 4. Implementación

Se creó un usuario administrativo secundario para separar las tareas de administración del usuario principal del laboratorio.

### Creación del usuario

```bash
sudo adduser secadmin
```

Posteriormente se incorporó al grupo administrativo del sistema.

```bash
sudo usermod -aG sudo secadmin
```

La opción `-aG` agrega el usuario al grupo indicado sin eliminar su pertenencia a otros grupos existentes.

---

## 5. Validación

Finalizada la implementación se verificó que el cambio se hubiera aplicado correctamente.

### Verificación de grupos

```bash
id secadmin
```

```bash
groups secadmin
```

La salida confirmó la pertenencia del usuario al grupo `sudo`.

### Validación funcional

Se inició sesión con el nuevo usuario y se comprobó la elevación de privilegios.

```bash
su - secadmin
```

```bash
sudo whoami
```

Resultado obtenido:

```text
root
```

La prueba confirmó que la asignación del privilegio administrativo era funcional y que el usuario podía ejecutar comandos mediante `sudo`.

---

## 6. Resultado final

Se implementó correctamente un esquema básico de administración segura de identidades locales:

* Creación de una identidad administrativa secundaria.
* Asignación controlada al grupo `sudo`.
* Validación técnica de la configuración.
* Confirmación funcional de la elevación de privilegios.

---

## 7. Conclusión

La implementación permitió aplicar un modelo básico de gestión de privilegios alineado con buenas prácticas de administración Linux.

El proceso incluyó auditoría previa, asignación controlada de privilegios y validación funcional, asegurando que los cambios realizados fueran verificables y reproducibles.

Este control establece una separación básica entre la identidad utilizada para las tareas habituales y una identidad destinada a operaciones administrativas, aplicando el principio de mínimo privilegio y permitiendo validar de forma controlada la asignación de privilegios mediante `sudo`.