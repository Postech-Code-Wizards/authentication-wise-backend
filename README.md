# 🔑 authentication-wise-backend

### 🌟 **Visão Geral**

O **Serviço de Autenticação** gerencia a autenticação de usuários no sistema, incluindo o registro de novos usuários, a verificação de credenciais e o gerenciamento de sessões. Ele também controla o processo de **login**, **alteração de senha** e **controle de roles** para diferentes tipos de usuários. O serviço é responsável por garantir a **segurança** e **autenticação** dentro do ecossistema de microserviços.

---

### Esquema de Banco de Dados 🗃️

| Coluna               | Tipo             | Descrição                                           |
|----------------------|------------------|-----------------------------------------------------|
| `id`                 | SERIAL           | Identificador único do usuário.                    |
| `email`              | VARCHAR(255)     | Endereço de email do usuário.                       |
| `username`           | VARCHAR(255)     | Nome de usuário único para login.                  |
| `password`           | VARCHAR(255)     | Senha do usuário (armazenada de forma segura).     |
| `role`               | ENUM             | Papel do usuário (ex: admin, paciente, médico).     |
| `created_at`         | TIMESTAMP        | Data de criação do usuário.                        |
| `last_login`         | TIMESTAMP        | Data e hora do último login.                       |
| `last_password_change` | TIMESTAMP      | Data e hora da última alteração de senha.          |

---

#### **Boas Práticas na Modelagem e Design**

1. **Armazenamento Seguro de Senhas**:
   - A senha é ser armazenada de forma segura utilizando técnicas de **hashing**, com o **bcrypt**, para garantir que as senhas não sejam armazenadas em texto claro no banco de dados.
   - O campo **`password`** será gerenciado de forma a garantir que o sistema seja **seguro contra ataques** como **SQL Injection** e **brute-force**.

2. **Controle de Sessões e Login**:
   - O **campo `last_login`** permite o controle do **último acesso** do usuário ao sistema, ajudando na análise de segurança e identificando possíveis **tentativas de acesso indevido**.
   - Para o controle de autenticação, adotamos uma abordagem baseada em **tokens JWT (JSON Web Token)** para garantir que a autenticação seja stateless (sem necessidade de armazenar o estado do usuário no servidor).

3. **Role-based Access Control (RBAC)**:
   - O campo **`role`** é fundamental para controlar os diferentes **níveis de acesso** no sistema. Por exemplo:
     - **admin**: Acesso completo ao sistema.
     - **paciente**: Acesso restrito à visualização e agendamento de consultas.
     - **médico**: Acesso a dados clínicos e agendamentos de consultas.
   - As roles podem ser definidas de acordo com os requisitos do sistema, garantindo **segurança** e **personalização** no acesso a diferentes partes do sistema.

4. **Gerenciamento de Alterações de Senha**:
   - O **campo `last_password_change`** garante que o sistema tenha um **controle de alterações** de senha, permitindo auditorias de segurança e forçando **políticas de atualização periódica de senhas**.
