# Proyecto de Salud - Modelos de Regresión y Clasificación

## Descripción del Proyecto

Este proyecto tiene como objetivo reducir y predecir la ** Cantidad de medicamneto Administrados** y clasificar el **Padecimiento** del paciente utilizando datos de salud. Se han implementado dos modelos principales:

- **Regresión Lineal:** Para predecir la cantidad de medicamentos.

## Justificación del Algoritmo Utilizado

### Algoritmo de Regresión Lineal
- **Justificación:** La Regresión Lineal es un modelo simple que permite predecir una variable continua en base a otras variables predictoras. Se eligió debido a su capacidad para proporcionar una relación clara entre variables y su eficiencia computacional.
- **Referencia:** [Regresión Lineal en Scikit-Learn](https://scikit-learn.org/stable/modules/linear_model.html#linear-regression)


## Descripción del Diseño del Modelo

### Modelo de Regresión Lineal
- **Objetivo:** Predecir la cantidad de medicamentos administrados usando altura y peso.
- **Variables:** Altura, Peso (predictoras); Cantidad (objetivo).
- **Estrategia:** Entrenamiento del modelo con los datos disponibles y evaluación usando el MSE.

### Modelo de Clasificación con Random Forest
- **Objetivo:** Clasificar el padecimiento del paciente basado en altura, peso, y cantidad de medicamentos.
- **Variables:** Altura, Peso, Cantidad (predictoras); idPadecimiento (objetivo).
- **Estrategia:** Entrenamiento del modelo con los datos disponibles y evaluación usando precisión, recall, y F1-score.

## Reporte de Evaluación y Optimización del Modelo

### Regresión Lineal
- **Métricas:** MSE = `X.XX`
- **Optimización:** Validación cruzada y ajuste de hiperparámetros.


## Archivos del Proyecto

- `parcial2.ipynb`: Código para los modelos.
