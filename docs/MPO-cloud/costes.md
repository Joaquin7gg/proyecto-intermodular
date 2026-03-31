## Estimación de costes de la infraestructura

Para estimar el coste de la infraestructura desplegada se ha utilizado la herramienta oficial [**AWS Pricing Calculator**](https://calculator.aws/), que permite calcular el gasto mensual en función de los recursos utilizados.

La arquitectura implementada está compuesta por:

- Una instancia **EC2** para el servidor web  
- Una base de datos gestionada mediante **Amazon RDS (MySQL)**  
- Almacenamiento en **Amazon S3**

Considerando un entorno de baja carga (tipo laboratorio o pequeña aplicación), el coste estimado mensual sería:

- **EC2:** ~30 €/mes  
- **RDS:** ~15 €/mes  
- **S3:** ~2 €/mes  
- **Transferencia de datos:** ~5–10 €/mes  

---

### Coste total estimado

El coste total aproximado se sitúa entre:

**45 € y 60 € al mes**, dependiendo del uso y del tráfico generado.

---

### Variación del coste

El coste estimado presenta un rango debido a que AWS utiliza un modelo de pago por uso. Esto implica que algunos servicios, como la transferencia de datos, el almacenamiento o el número de peticiones, pueden variar en función de la actividad de la aplicación.

En particular, el factor que más influye en la variación del coste es el tráfico de red, seguido del uso del almacenamiento en S3 y del consumo asociado a la base de datos.

Por este motivo, se establece un rango de coste estimado en lugar de un valor fijo.

---

### Observaciones

AWS utiliza un modelo de pago por uso (*pay-as-you-go*), por lo que el coste final puede variar en función del consumo real de recursos.