//Ejercicio elaborado por Ernesto Cuellar para la Clase de Fundamentos 1 MDIS- 2015 Semestre II

// se declaran los nombres de las letras y las tablas que se van a usar en el ejercicio
Table  tabloide;  
PFont letra;

// El presente ejercicio esta basado en los datos del Mapa 1.2. Distribución de recursos del Fondo CTeI del SGR aprobados por departamento, vigencia 2012, bienios 2013 - 2014 y 2015 - 2016, con corte a 31 de diciembre de 2014*
// tomado del informe anual de indicadores de ciencia y tecnologia 2014. pagina 44 del informe pagina 42 del PDF. 


void  setup()  
{  

//DEFINICIONES
// declaracion del tamano del lienzo
size(1100,1300);
// se define el relleno del lienzo
background(255);
//se carga la letra
letra = loadFont("CenturyGothic-Bold-48.vlw");
// se define el tamano de la letra
textFont(letra,20);
// se define el suavizado de la letra.
smooth(5);

//TITULO
// se pone el texto del titulo
fill(0);
rect(0,0, 1100, 95);
fill(255);
text("Distribución de recursos del Fondo CTeI del SGR aprobados por departamento",10,25);
text("Vigencia 2012, bienios 2013 - 2014 y 2015 - 2016, con corte a 31 de diciembre de 2014",10,55);
text("Cifras en Miles de Millones de Pesos COP",10,85);


//LEYENDA
// Hacemos la leyenda de la tabla
fill(255);
//contenedor
rect(700,200, 350, 130);
//texto de la leyenda
fill(0);
text("Recursos del Fondo CTeI del SGR",715,230);
text("Recursos Cofinanciados",715,290);
//Se grafica con una barra roja los aportes del Fondo de Ciencia y Tecnologia
fill(200,0,0);
rect(715,235,150,15);
//Se grafica con una barra verde que representara los aportes de Cofinanciacion
fill(0,200,0);
rect(715,300,150,15);



//Cargado de la tabla
 tabloide  =  loadTable("mat3limp.csv",  "header");  
// se verifica que se esten trabajando con todas las columnas de la tabla
println(tabloide.getRowCount()  +  "  Columnas totales en la tabla"); 

// se utiliza un for para leer la tabla y asignar las variables
    for  (TableRow  fila  :  tabloide.rows())  {  
    // se definen las variables que se traen de la tabla
    // se define id como entero para facilitar asignar posiciones    
        int id = fila.getInt("id");
        String  Departamento =  fila.getString("Departamento");  
        float  Fondo  =  fila.getFloat("FCTeI");  
        float  Confin =  fila.getFloat("Coofinanciacion"); 
        int  Proyectos =  fila.getInt("Proyectos"); 
        
        // Hacer una variable que calcule la suma de los 2 fondos
        float InveDepto = Fondo+Confin;
                                
        // Se grafican los nombres de los departamentos
        fill(0,0,0);
        text(Departamento, 100, 100+(id*35));
        // Se convierte la variable en entero para que no imprima puntos decimales
        int inv = int(InveDepto);
        // se imprime la variable que suma los recursos de los 2 fondos.
        text("Total $"+inv,((InveDepto)/1000)+310 , 100+(id*35));
        //Se grafica con una barra roja los aportes del Fondo de Ciencia y Tecnologia
        fill(200,0,0);
        rect(300,85+(id*35),Fondo/1000,15);
        //Se grafica con una barra verde los aportes del Cofinanciacion del Departamento que comienza a partir de la plata que pone el Fondo de Ciencia y Tecnologia.
        fill(0,200,0);
        rect(300+(Fondo/1000),85+(id*35),Confin/1000,15);
        //Se grafica con una barra gris los aportes sumados para verificar que las barras tengan la longitud exacta
        //fill(150);       
        //rect(300,90+(id*35),(Fondo+Confin)/1000,10);
        // Imprimimos en la consola para verificar que Processing este leyendo todas las variables.
        //println(Departamento+" tiene el id "+id+" recibio del Fondo $"+Fondo+" Cofinancio $"+Confin+" y tiene "+Proyectos+" proyectos" );  
    }  
   
    
    
}
