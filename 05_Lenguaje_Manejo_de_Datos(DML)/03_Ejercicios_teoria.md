# Ejercicios de teoría
1. ¿Qué son las propiedades ACID?
```sql

```



2. ¿Cuáles son los tres problemas de concurrencia en el acceso a datos que pueden suceder cuando se realizan transacciones? Ponga un ejemplo para cada uno de ellos.
```sql

```



3. Cuando se trabaja con transacciones, el SGBD puede bloquear conjuntos de datos para evitar o permitir que sucedan los problemas de concurrencia comentados en el ejercicio anterior. ¿Cuáles son los cuatro niveles de aislamiento que se pueden solicitar al SGBD?
```sql

```



4. ¿Cuál es el nivel de aislamiento que se usa por defecto en las tablas InnoDB de MySQL?
```sql

```



5. ¿Es posible realizar transacciones sobre tablas MyISAM de MySQL?
```sql

```



6. ¿Qué diferencias existen entre los motores InnoDB y MyISAM de MySQL?
```sql

```



7. Considera que tenemos una tabla donde almacenamos información sobre cuentas bancarias definida de la siguiente manera:
```sql
CREATE TABLE cuentas (
    id INTEGER UNSIGNED PRIMARY KEY,
    saldo DECIMAL(11,2) CHECK (saldo >= 0)
);
```
```sql

```



Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción:
```sql
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 20;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 30;
COMMIT;
```
```sql

```



- ¿Qué ocurriría si el sistema falla o si se pierde la conexión entre el cliente y el servidor después de realizar la primera sentencia `UPDATE`?
```sql

```



- ¿Qué ocurriría si no existiese alguna de las dos cuentas (`id` = 20 y `id` = 30)?
```sql

```



- ¿Qué ocurriría en el caso de que la primera sentencia `UPDATE` falle porque hay menos de 100 € en la cuenta y no se cumpla la restricción del `CHECK` establecida en la tabla?
```sql

```
