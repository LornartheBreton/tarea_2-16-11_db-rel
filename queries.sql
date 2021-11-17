--- Datos importantes

--- Arnes 30cm x 21cm x 8cm
--- Peso 0.5 kg por movie
--- Peso m�ximo cilindro 50 kg

---- Calculamos cuantas pelis aguanta cada cilindro. Como las
---- dimensiones del cilindro pueden ser libres (con la restricci�n
---- de que cada uno aguanta 50kg), nos conviene maximizar esta medida.

SELECT 
	50/0.5 AS pelis_por_cilindro;

---- Aguanta 100 pelis. Como cada peli mide 5,040 cm^3, multiplicamos
SELECT 
	5040*100 AS volumen_minimo_de_cilindro;
	
---- Por lo tanto, el vol�men del cilindro debe de ser 
---- mayor o igual a 504,000. Tomando en cuenta la f�rmula del 
---- �rea del cilindro (pi * radio^2 * altura), debemos construir
---- el cilindro a partir de eso.
 
---- El radio ya lo tenemos. Si ponemos el disco con arnes acostado
---- sobre la base del cilindro (lease, tal que el rect�ngulo que
---- forman los lados de 21 y 30 cm quepa sobre la base circular
---- del cilindro), obtenemos que el radio del cilindro debe de ser
---- la mitad de la diagonal de ese rect�ngulo, la cu�l obtenemos 
---- con el teorema de pit�goras.
SELECT 
	sqrt(21^2+30^2)/2 AS radio_del_cilindro;

---- Por lo tanto, el radio de la base debe de ser de aproximadamente
---- 18.31 cm.

---- Como el rect�ngulo de 21 x 30 cm es la "base" de cada peli, la
---- altura de cada peli es de los 8cm. Como cada cilindro almacena
---- 100 pel�culas, entonces la altura es de 
SELECT 
	100*8 AS altura_del_cilindro;

---- 800 cm (ya s�, medio tonto hacer la multiplicaci�n en un query, 
---- pero quer�a mantener el train of tought).

---- Por lo tanto, cada cilindro debe de medir 
---- ALTURA: 800 cm
---- RADIO (aprox): 18.31 cm
 
---- Juntando todos los c�lculos hasta el momento, cada cilindro
---- tiene un vol�men de
SELECT
	pi()*((21^2+30^2)/4)*(50/0.5)*8 AS volumen_de_cilindro;

---- Aproximadamente 842,575.15 cm^3, que cumple con nuestro target
---- de que sea mayor o igual a 504,000 cm^3 (hay mucho espacio de
---- sobra, pero ellos me pidieron un cilindro, no un prisma. Sorry.)

---- Como un appendix cada una de nuestras tiendas necesita (us� ceiling
---- para que sobre espacio en los cilindros en vez que falte).

SELECT
	store_id,
	CEILING (COUNT(inventory_id)/(50/0.5)) AS cilindros_por_tienda
FROM inventory i 
GROUP BY store_id;

