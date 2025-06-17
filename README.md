# Proyecto Infraestructura - Ingeniería de Software

Este repositorio contiene la configuración de Terraform para gestionar la infraestructura del proyecto final de Ingeniería de Software, desplegando un cluster de Google Kubernetes Engine (GKE) en Google Cloud Platform.

## 🏗️ Arquitectura

La infraestructura despliega:
- **VPC personalizada** con configuración de red optimizada
- **Cluster GKE** con autoscaling y gestión automática
- **Múltiples ambientes** (dev, stage, prod) con configuraciones específicas

```
┌─────────────────────────────────────────┐
│              Google Cloud               │
│  ┌─────────────────────────────────────┐│
│  │            VPC Network              ││
│  │  ┌─────────────────────────────────┐││
│  │  │        GKE Subnetwork           │││
│  │  │  ┌─────────────────────────────┐│││
│  │  │  │       GKE Cluster           ││││
│  │  │  │  - Node Pool (1-5 nodes)    ││││
│  │  │  │  - Workload Identity        ││││
│  │  │  │  - Auto-scaling enabled     ││││
│  │  │  └─────────────────────────────┘│││
│  │  └─────────────────────────────────┘││
│  └─────────────────────────────────────┘│
└─────────────────────────────────────────┘
```

## 📁 Estructura del Proyecto

```
proyecto-infra/
├── main.tf                    # Configuración principal - orquesta módulos
├── variables.tf              # Variables globales del proyecto
├── providers.tf              # Configuración del provider de Google Cloud
├── backend.tf                # Estado remoto en Google Cloud Storage
├── outputs.tf                # Outputs principales del proyecto
├── terraform.tfvars          # Variables por defecto
├── versions.tf               # Versiones de Terraform y providers
│
├── environments/             # Configuraciones específicas por ambiente
│   ├── dev/
│   │   ├── backend.tf        # Backend específico para desarrollo
│   │   └── terraform.tfvars  # Variables para ambiente de desarrollo
│   ├── stage/
│   │   ├── backend.tf        # Backend específico para staging
│   │   └── terraform.tfvars  # Variables para ambiente de staging
│   └── prod/
│       ├── backend.tf        # Backend específico para producción
│       └── terraform.tfvars  # Variables para ambiente de producción
│
└── modules/                  # Módulos reutilizables
    ├── vpc/                  # Módulo de red VPC
    │   ├── main.tf           # Recursos de red (VPC + Subnetwork)
    │   ├── variables.tf      # Variables del módulo VPC
    │   └── outputs.tf        # Outputs del módulo VPC
    └── gke/                  # Módulo de Kubernetes
        ├── main.tf           # Recursos GKE (Cluster + Node Pool)
        ├── variables.tf      # Variables del módulo GKE
        └── outputs.tf        # Outputs del módulo GKE
```

## 🧩 Módulos Reutilizables

### Módulo VPC (`modules/vpc/`)

Gestiona la configuración de red en Google Cloud:

**Recursos creados:**
- `google_compute_network`: Red VPC principal sin subredes automáticas
- `google_compute_subnetwork`: Subred dedicada para GKE con acceso privado a Google

**Variables principales:**
- `project_id`: ID del proyecto en GCP
- `network_name`: Nombre de la red VPC (default: `ingesoft-vpc`)
- `subnetwork_ip_cidr_range`: Rango CIDR (default: `10.10.0.0/20`)

### Módulo GKE (`modules/gke/`)

Despliega y configura el cluster de Kubernetes:

**Recursos creados:**
- `google_container_cluster`: Cluster principal con configuración optimizada
- `google_container_node_pool`: Pool de nodos con autoscaling

**Características configuradas:**
- ✅ Workload Identity para seguridad mejorada
- ✅ Logging y monitoring nativos de Kubernetes
- ✅ Autoscaling automático de nodos
- ✅ Auto-repair y auto-upgrade habilitados
- ✅ Canal de versiones REGULAR para estabilidad

## 🌍 Configuración por Ambientes

| Ambiente | Nodos Iniciales | Nodos Mínimos | Nodos Máximos | Uso |
|----------|----------------|---------------|---------------|-----|
| **dev**  | 1              | 1             | 2             | Desarrollo y pruebas |
| **stage**| 2              | 1             | 3             | Staging y QA |
| **prod** | 3              | 3             | 5             | Producción |

## 🚀 Uso

### Requisitos Previos

1. **Terraform** >= 1.0
2. **Google Cloud SDK** configurado
3. **Proyecto GCP** con APIs habilitadas:
   - Compute Engine API
   - Kubernetes Engine API
   - Cloud Resource Manager API

### Configuración Inicial

1. **Autenticación con Google Cloud:**
   ```bash
   gcloud auth application-default login
   gcloud config set project YOUR_PROJECT_ID
   ```

2. **Inicializar Terraform:**
   ```bash
   terraform init
   ```

### Despliegue por Ambiente

#### Desarrollo
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

#### Staging
```bash
cd environments/stage
terraform init
terraform plan
terraform apply
```

#### Producción
```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

### Comandos Útiles

```bash
# Ver estado actual
terraform show

# Formatear código
terraform fmt

# Validar configuración
terraform validate

# Ver outputs
terraform output

# Destruir infraestructura (¡Cuidado en producción!)
terraform destroy
```

## 🔧 Variables Principales

| Variable | Descripción | Default | Ambiente |
|----------|-------------|---------|----------|
| `project_id` | ID del proyecto GCP | - | Requerido |
| `region` | Región principal | `us-central1` | Configurable |
| `cluster_name` | Nombre del cluster | `ingesoft-final` | Configurable |
| `gke_node_machine_type` | Tipo de máquina | `e2-standard-2` | Configurable |
| `vpc_network_name` | Nombre de la VPC | `ingesoft-vpc` | Configurable |

## 🏆 Buenas Prácticas Implementadas

### ✅ Organización
- **Separación por ambientes** con configuraciones independientes
- **Modularización** para reutilización y mantenimiento
- **Documentación** completa de variables y outputs

### ✅ Seguridad
- **Outputs sensibles** marcados apropiadamente
- **OAuth scopes mínimos** necesarios
- **Workload Identity** configurado
- **Private Google Access** habilitado

### ✅ Operaciones
- **Estado remoto** en Google Cloud Storage
- **Autoscaling** configurado por ambiente
- **Auto-repair/upgrade** para nodos
- **Logging y monitoring** integrados

### ✅ Código
- **Variables tipadas** con descripciones
- **Outputs estructurados** y documentados
- **Convenciones de nombres** consistentes

## 🔍 Outputs Disponibles

Después del despliegue, los siguientes outputs estarán disponibles:

```bash
terraform output cluster_name           # Nombre del cluster
terraform output cluster_endpoint       # Endpoint del cluster (sensible)
terraform output network_name          # Nombre de la VPC
terraform output workload_identity_pool # Pool de Workload Identity
```

## 🐛 Troubleshooting

### Error: "Backend configuration changed"
```bash
terraform init -reconfigure
```

### Error: "APIs not enabled"
```bash
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```

### Error: "Insufficient permissions"
Verificar que el service account tenga los roles:
- Compute Admin
- Kubernetes Engine Admin
- Service Account User

## 📝 Notas Técnicas

- **MTU**: Configurado a 1460 para optimización de red
- **CIDR**: Rango `10.10.0.0/20` proporciona ~4000 IPs
- **Machine Type**: `e2-standard-2` balancea costo y rendimiento
- **Disk**: 50GB SSD por nodo (comentado en configuración actual)

## 📋 Estado del Proyecto

- ✅ Infraestructura base implementada
- ✅ Módulos VPC y GKE funcionales
- ✅ Configuración multi-ambiente
- ✅ Estado remoto configurado
- 🔄 Node configuration comentada (pendiente de validación)

---
*Proyecto desarrollado para el curso de Ingeniería de Software - Universidad*