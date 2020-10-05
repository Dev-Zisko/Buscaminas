program Buscaminas;
uses crt,dos,mmsystem,math,sysutils;
type matriz= array[1..100,1..100]of char;
var
 a,b:cardinal;
 m:matriz;
 frase,puntaje:string;
 opcion:char;
 horaI,horaF,tiempo:integer;
 i,f,c,turno,y,contadorCondicion:integer;
 Horas,Minutos,Segundos,Centesimas:word; { Parámetros para obtener la hora. }

procedure colocarMinas(var m:matriz); {Inicio de los procesos utilizados por el buscaminas}
var
x,y:integer;
i:integer;
begin


           randomize;
           x:=0; y:=0;

           for i:=1 to 10 do //coloca las 10  minas aleatoriamente
           begin


                x:=1+random(9);
                y:=1+random(9);
                if(m[x,y]=' ')then
                repeat
                begin
                     x:=1+random(9);
                     y:=1+random(9);
                end;
                until(m[x,y]<>' ');
                m[x,y]:=' '
           end;




end;
procedure Fuera; { Esta opción nos permite salir del programa. }
begin
     textcolor(14);
     writeln('Gracias por usarme.');
     writeln('Presione la tecla Enter para continuar.');
     readln;
     halt;
end;
procedure conocerDatos(var f,c,turno:integer);  //Proceso que permite al usuario introducir las coordenadas
begin
     repeat
     begin
     writeln('Ingrese coordenada f(fila)');
     readln(f);
     if(f<0)or(f>9)then
     writeln('Error coordenada f invalida, intente nuevamente');
     if(f=0)then
     Fuera;
     end;
     until((f>0)and(f<=9));
     repeat
     begin
     writeln('Ingrese coordenada c(columna)');
     readln(c);
     if(c<0)or(c>9)then
     writeln('Error coordenada c invalida, intente nuevamente');
     if(c=0)then
     Fuera;
     end;
     until((c>0)and(c<=9));

     if(m[f,c]<>'#')and(m[f,c]<>'1')and(m[f,c]<>'2')and(m[f,c]<>'3')and(m[f,c]<>'4')
     and(m[f,c]<>'5')and(m[f,c]<>'6')and(m[f,c]<>'7')and(m[f,c]<>'8')then
     turno:=turno+1;
end;

procedure clasificar(var m:matriz;f,c:integer);//condiciones para cada sección de la matriz
var
contador:integer;
x:boolean;

begin
     contador:=0;

     if(m[f,c]=' ')then // Condición: si en la casilla seleccionada hay una mina, entonces
     begin
          x:=true;
          if x then
          PlaySound('boom.wav',0,SND_ASYNC);
          textcolor(4);
          clrscr;
          writeln('  _____ ');
          writeln(' |___ / ');
          writeln('   |_ \ ');
          writeln('  ___) |');
          writeln(' |____/ ');
          delay(1500);
          clrscr;
          writeln('  ____   ');
          writeln(' |___ \  ');
          writeln('   __) | ');
          writeln('  / __/  ');
          writeln(' |_____| ');
          delay(1300);
          clrscr;
          writeln('  _  ');
          writeln(' / | ');
          writeln(' | | ');
          writeln(' | | ');
          writeln(' |_| ');
          delay(1150);
          clrscr;
          writeln('  ____     ___     ___    __  __   _   _   _ ');
          writeln(' | __ )   / _ \   / _ \  |  \/  | | | | | | |');
          writeln(' |  _ \  | | | | | | | | | |\/| | | | | | | |');
          writeln(' | |_) | | |_| | | |_| | | |  | | |_| |_| |_|');
          writeln(' |____/   \___/   \___/  |_|  |_| (_) (_) (_)');
          writeln;writeln;
          writeln('Perdiste.'); writeln('Inicia de nuevo el programa para jugar otra vez');
          readln;halt;
     end

     else if((m[f,c]<>' ')and(m[f,c]<>'#'))then
     begin

          if((f=1)and(c=1))then //esquina superior izquierda
          begin
               if(m[1,2]=' ')then
               contador:=contador+1;
               if(m[2,1]=' ')then
               contador:=contador+1;
               if(m[2,2]=' ')then
               contador:=contador+1;
          end;
          if((f=1)and(c=9))then //esquina superior derecha
          begin
               if(m[1,8]=' ')then
               contador:=contador+1;
               if(m[2,9]=' ')then
               contador:=contador+1;
               if(m[2,8]=' ')then
               contador:=contador+1;
          end;
          if((f=9)and(c=1))then //esquina inferior izquierda
          begin
               if(m[9,2]=' ')then
               contador:=contador+1;
               if(m[8,1]=' ')then
               contador:=contador+1;
               if(m[8,2]=' ')then
               contador:=contador+1;
          end;
          if((f=9)and(c=9))then //esquina inferior derecha
          begin
               if(m[9,8]=' ')then
               contador:=contador+1;
               if(m[8,9]=' ')then
               contador:=contador+1;
               if(m[8,8]=' ')then
               contador:=contador+1;
          end;
          if((c=1)and((f>1)and(f<9)))then //Lateral izquierdo
          begin
               if((m[(f-1),c])=' ')then
               contador:=contador+1;
               if((m[(f-1),(c+1)])=' ')then
               contador:=contador+1;
               if((m[f,(c+1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),(c+1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),c])=' ')then
               contador:=contador+1;
          end;
          if ((c=9)and((f>1)and(f<9)))then //Lateral Derecho
          begin
               if((m[(f-1),c])=' ')then
               contador:=contador+1;
               if((m[(f-1),(c-1)])=' ')then
               contador:=contador+1;
               if((m[f,(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),c])=' ')then
               contador:=contador+1;
          end;
          if((f=1)and((c>1)and(c<9)))then //lateral Superior;
          begin
               if((m[f,(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f+1),c])=' ')then
               contador:=contador+1;
               if((m[(f+1),(c+1)])=' ')then
               contador:=contador+1;
               if((m[f,(c+1)])=' ')then
               contador:=contador+1;
          end;
          if((f=9)and((c>1)and(c<9)))then //lateral Inferior
          begin
               if ((m[f,(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f-1),(c-1)])=' ')then
               contador:=contador+1;
               if((m[(f-1),c])=' ')then
               contador:=contador+1;
               if((m[(f-1),(c+1)])=' ')then
               contador:=contador+1;
               if((m[f,(c+1)])=' ') then
               contador:=contador+1;
          end;
          if(f>1)and(c>1)and(f<9)and(c<9)then // Parte central
          begin
               if(m[(f-1),(c-1)] =' ')then
               contador:=contador+1;
               if(m[(f-1),c]=' ')then
               contador:=contador+1;
               if(m[(f-1),(c+1)] =' ')then
               contador:=contador+1;
               if (m[f,(c+1)]=' ')then
               contador:=contador+1;
               if(m[(f+1),(c+1)] =' ')then
               contador:=contador+1;
               if(m[(f+1),c]=' ')then
               contador:=contador+1;
               if(m[(f+1),(c-1)] =' ')then
               contador:=contador+1;
               if(m[f,(c-1)]=' ')then
               contador:=contador+1;
          end;
          case contador of
          1: m[f,c]:='1';
          2: m[f,c]:='2';
          3: m[f,c]:='3';
          4: m[f,c]:='4';
          5: m[f,c]:='5';
          6: m[f,c]:='6';
          7: m[f,c]:='7';
          8: m[f,c]:='8'
          else
          m[f,c]:='#'; // '#' Es un espacio en blanco
          end;
     end;// fin del else
end;

Procedure clasificarBlancos(f,c:integer); // expande las casillas alrededor de las coordenadas correspondientes
begin
if(m[f,c]='#')then
     begin
          clasificar(m,(f-1),(c-1));
          clasificar(m,(f-1),c);
          clasificar(m,(f-1),(c+1));
          clasificar(m,f,(c+1));
          clasificar(m,(f+1),(c+1));
          clasificar(m,(f+1),c);
          clasificar(m,(f+1),(c-1));
          clasificar(m,f,(c-1));
     end;
end;

procedure buscarBlancos(var m:matriz); // revisa la matriz en busca de espacios en blanco para expandir
var
i,j:integer;

begin

     for i:=1 to 9 do
     begin
          for j:=1 to 9 do
          begin
               if(m[i,j]='#')then
               begin
                    clasificarBlancos(i,j);
               end;
          end;
     end;
end;

procedure mostrarMatriz(m:matriz);
var
i,j:integer;
begin

     for i:=1 to 9 do
     begin
          for j:=1 to 9 do
          begin
               textcolor(5);write('[');
               textcolor(15);write(m[i,j]);
               textcolor(5);write(']');
          end;
          textcolor(7);
          writeln;
     end;
end;



procedure mostrarInterfaz(turno:integer);//Muestra la interfaz del cuadro junto a la matriz del buscaminas
begin
textcolor(5); gotoxy(40,1); writeln(' _____________________________');
textcolor(11); gotoxy(40,2); write('°°°°°°°°°°°Buscaminas°°°°°°°°°');
textcolor(5); gotoxy(40,2); writeln('|'); gotoxy(40,3);
writeln(' _____________________________'); gotoxy(40,3); writeln('|');
gotoxy(40,4); writeln('|'); gotoxy(40,5); writeln('|'); gotoxy(40,6);
writeln('|'); gotoxy(40,7); writeln('|'); gotoxy(40,8); writeln('|');
gotoxy(40,9); writeln('|'); gotoxy(40,10); writeln('|'); gotoxy(40,11);
writeln('|'); gotoxy(40,12); writeln('|'); gotoxy(40,13); writeln('|');
gotoxy(70,2); writeln('|'); gotoxy(70,3); writeln('|'); gotoxy(70,4);
writeln('|'); gotoxy(70,5); writeln('|'); gotoxy(70,6); writeln('|');
gotoxy(70,7); writeln('|'); gotoxy(70,8); writeln('|'); gotoxy(70,9);
writeln('|'); gotoxy(70,10); writeln('|'); gotoxy(70,11); writeln('|');
gotoxy(70,12); writeln('|'); gotoxy(70,13); writeln('|'); gotoxy(40,14);
writeln('¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯'); gotoxy(55,4); writeln('|');
gotoxy(55,5); writeln('|'); gotoxy(55,6); writeln('|'); gotoxy(55,7);
writeln('|'); gotoxy(55,8); writeln('|'); gotoxy(55,9); writeln('|');
gotoxy(55,10); writeln('|'); gotoxy(55,11); writeln('|'); gotoxy(55,12);
writeln('|'); gotoxy(55,13); writeln('|'); gotoxy(41,8); writeln('_');
gotoxy(42,8); writeln('_'); gotoxy(43,8); writeln('_'); gotoxy(44,8);
writeln('_'); gotoxy(45,8); writeln('_'); gotoxy(46,8); writeln('_');
gotoxy(47,8); writeln('_'); gotoxy(48,8); writeln('_'); gotoxy(49,8);
writeln('_'); gotoxy(50,8); writeln('_'); gotoxy(51,8); writeln('_');
gotoxy(52,8); writeln('_'); gotoxy(53,8); writeln('_'); gotoxy(54,8);
writeln('_'); gotoxy(56,8); writeln('_'); gotoxy(57,8); writeln('_');
gotoxy(58,8); writeln('_'); gotoxy(59,8); writeln('_'); gotoxy(60,8);
writeln('_'); gotoxy(61,8); writeln('_'); gotoxy(62,8); writeln('_');
gotoxy(63,8); writeln('_'); gotoxy(64,8); writeln('_'); gotoxy(65,8);
writeln('_'); gotoxy(66,8); writeln('_'); gotoxy(67,8); writeln('_');
gotoxy(68,8); writeln('_'); gotoxy(69,8); writeln('_'); textcolor(11);
gotoxy(41,4); write('Salir:');gotoxy(41,5);writeln('Presione 0');gotoxy(56,4);writeln('Despejadas:0');
gotoxy(56,6);write('Puntuacion:');gotoxy(41,9);writeln('Turno: ',turno);
gotoxy(56,9); write('Creditos:'); textcolor(15);gotoxy(56,10);
write('Jose Francisco'); gotoxy(56,11); write('Christian');
gotoxy(56,12); write('Jhonaire');gotoxy(1,11);

end;


procedure verificarCondicion(m:matriz; var contadorCondicion{,puntaje}:integer); // verifica la condición necesaria para ganar
var
i,j:integer;
x:boolean;
begin
     contadorCondicion:=0;
     for i:=1 to 9 do
     begin
          for j:=1 to 9 do
          begin
               case(m[i,j])of
                    '#': contadorCondicion:=contadorCondicion+1;
                    '1','2','3','4','5','6','7','8':contadorcondicion:=contadorCondicion+1;
               end;
          end;
     end;
     gotoxy(56,4);
     textcolor(11);writeln('Despejadas:',contadorCondicion);textcolor(white);
     gotoxy(1,11);
     //contadorCondicion:=71; // Se usa para probar la condicion de victoria
     if (contadorCondicion=71)then // condición: Si gana, entonces
     begin

          x:=true;
          if x then
          PlaySound('Victory.wav',0,SND_ASYNC);
          textColor(11);

          gotoxy(1,15);
          writeln('__     __  ___    ____   _____    ___    ____    ___      _      _ ');
          writeln('\ \   / / |_ _|  / ___| |_   _|  / _ \  |  _ \  |_ _|    / \    | |');
          writeln(' \ \ / /   | |  | |       | |   | | | | | |_) |  | |    / _ \   | |');
          writeln('  \ V /    | |  | |___    | |   | |_| | |  _ <   | |   / ___ \  |_|');
          writeln('   \_/    |___|  \____|   |_|    \___/  |_| \_\ |___| /_/   \_\ (_)');
          writeln;
          writeln;
          writeln(' Inicie de nuevo el programa para jugar de nuevo ');


     end;

          //puntaje:=contadorCondicion; <<-- Calculaba el puntaje cuando era numerico

end;     // fin de los procesos del buscaminas
procedure puntuacion(var horaI,horaF,tiempo:integer; var horas,minutos,segundos,centesimas:word;var puntaje:string;y:integer); // se encarga de calcular el tiempo utilizado para despejar la matriz y da una puntuacion basada en un rango dependiendo del tiempo, varia desde menos de 1 minuto hasta mas de 10 minutos
begin
     if(y=0)then
     begin
          GetTime(horas,minutos,segundos,centesimas);
          minutos:=minutos*60;
          horaI:=minutos+segundos;
     end;
     if(y=1)then
     begin
          GetTime(horas,minutos,segundos,centesimas);
          minutos:=minutos*60;
          horaF:=minutos+segundos;
          tiempo:=horaF-horaI;
          if((tiempo)<= 60)then //menos de 1 minuto
          puntaje:='BuscaMinas'
          else if ((tiempo)<= 120)then //menos de 2 minutos
          puntaje:='Legendario'
          else if ((tiempo)<= 180)then  //menos de 3 minutos
          puntaje:='Epico'
          else if ((tiempo)<= 240)then //menos de 4 minutos
          puntaje:='Experto'
          else if ((tiempo)<= 300)then //menos de 5 minutos
          puntaje:='Maestro'
          else if ((tiempo)<= 360)then  //menos de 6 minutos
          puntaje:='Avanzado'
          else if ((tiempo)<= 420)then //menos de 7 minutos
          puntaje:='Buscador'
          else if ((tiempo)<= 480)then //menos de 8 minutos
          puntaje:='Suertudo'
          else if ((tiempo)<= 540)then //menos de 9 minutos
          puntaje:='Suicida'
          else if ((tiempo)<= 600)then //menos de 10 minutos
          puntaje:='Novato';
          gotoxy(56,7);textcolor(lightred);writeln(puntaje);gotoxy(1,11);

         { if((tiempo)<= 60)then //menos de 1 minuto    calculaba el puntaje cuando usaba numeros pero eran puntajes constantes
          puntaje:=puntaje*11
          else if ((tiempo)<= 120)then //menos de 2 minutos
          puntaje:=puntaje*10
          else if ((tiempo)<= 180)then  //menos de 3 minutos
          puntaje:=puntaje*9
          else if ((tiempo)<= 240)then //menos de 4 minutos
          puntaje:=puntaje*8
          else if ((tiempo)<= 300)then //menos de 5 minutos
          puntaje:=puntaje*7
          else if ((tiempo)<= 360)then  //menos de 6 minutos
          puntaje:=puntaje*6
          else if ((tiempo)<= 420)then //menos de 7 minutos
          puntaje:=puntaje*5
          else if ((tiempo)<= 480)then //menos de 8 minutos
          puntaje:=puntaje*4
          else if ((tiempo)<= 540)then //menos de 9 minutos
          puntaje:=puntaje*3
          else if ((tiempo)<= 600)then //menos de 10 minutos
          puntaje:=puntaje*2;
          gotoxy(56,7);writeln(puntaje);gotoxy(1,11);}

     end;

end;

{Profesora este proceso debia sustituir el for del programa principal pero
 no logramos hacer que funcione asi que no lo colocamos en el programa:

procedure check(var m:matriz; var w:matrizEntera);
    var
    i,j,k,acum:integer;
    begin

    for i:=1 to 9 do
    begin
         for j:=1 to 9 do
         begin
              write(w[i,j]);
         end;
         writeln;
    end;
    readln;



    for i:=1 to 9 do
     begin
          for j:=1 to 9 do
          begin
         acum:=0;
         while (acum=0) do
         begin
              if (m[i,j-1]='#') and (w[i,j-1]<>1) then
              k:=1
              else if(m[i-1,j-1]='#') and (w[i-1,j-1]<>1) then
              k:=1
              else if(m[i-1,j]='#') and (w[i-1,j]<>1) then
              k:=1
              else if(m[i-1,j+1]='#') and (w[i-1,j+1]<>1) then
              k:=1
              else k:=0;

              if k=1 then
              begin
                   writeln('si entra');
                   buscarBlancos(m);
                   acum:=0;
              end;
              if k=0 then
              acum:=1;

          end;
        end;
      end;

    end; }


procedure Jugar(var contadorCondicion:integer); { Esta opción del menu inicia el juego. }
var
x:boolean;
begin
x:=true;

     if x then
     PlaySound('Juego.wav',0,SND_ASYNC); //inicia la musica del juego

     f:=0; c:=0; //coordenadas de filas y columnas
     turno:=0; //cuantas veces ha introducido coordenadas
     colocarMinas(m);
     y:=0; //permite entrar a la primera parte del procedure puntuacion
     puntuacion(horaI,horaF,tiempo,horas,minutos,segundos,centesimas,puntaje,y); //calcula la hora a la cual comenzo el juego
     mostrarMatriz(m);
     mostrarInterfaz(turno);
     while(contadorCondicion<71)do //mientras no hayas ganado
     begin
          contadorCondicion:=0; // contador necesario para cumplir la condicion para ganar
          conocerDatos(f,c,turno); //introduce coordenadas
          clasificar(m,f,c);
          buscarBlancos(m);
          for i:=1 to 18 do // ciclo para que busque varias veces los nuevos blancos en la matriz almenos la cantidad maxima de veces que se pueda necesitar
          begin
               buscarBlancos(m);
          end;
          clrscr;
          mostrarMatriz(m);
          mostrarInterfaz(turno);
          verificarCondicion(m,contadorCondicion{,puntaje}); //verifica si se despejan todas las casillas sin minas
     end;
      y:=y+1;  // permite entrar a la segunda parte del procedure puntuacion
      puntuacion(horaI,horaF,tiempo,horas,minutos,segundos,centesimas,puntaje,y); //calcula la hora a la que termina el juego y el tiempo que tardo en segundos, ademas de calcular el puntaje
      readln;
      clrscr;
      fuera; //sale del programa
end;

procedure Hora(var horas,minutos,segundos,centesimas:word); { Esta opción del menu recoge la hora y fecha, mediante el uso de la libreria DOS.}
begin
     writeln('La hora es:');

     while not Keypressed do
     begin
          gotoxy(13,1);
          GetTime(horas,minutos,segundos,centesimas);
          textcolor(3);
          writeln(horas,':',minutos,':',segundos);
          textcolor(14);
          writeln;
          writeln;
          writeln('Presione la tecla enter para volver al menu.');
          delay(1000);
     end;
     readln;
end;

procedure BuscarMaximo(var a,b:cardinal);
begin
     clrscr;
     writeln;
     writeln('A continuacion se mostrara un ejemplo de la funcion Max:');
     writeln;
     writeln('Ingrese el valor de un numero(Que no exceda de 10 digitos):');
     readln(a);
     writeln('Ingrese el valor de otro numero(Que no exceda de 10 digitos):');
     readln(b);
     if (a=b) then
     writeln('Los numeros son iguales.')
     else
     writeln('El mayor valor de ambos numeros dados es: ',max(a,b));
     writeln('Presione la tecla Enter para continuar.');
     readln;
end;
procedure BuscarMinimo(var a,b:cardinal);
begin
     clrscr;
     writeln;
     writeln('A continuacion se mostrara un ejemplo de la funcion Min:');
     writeln;
     writeln('Ingrese el valor de un numero(Que no exceda de 10 digitos):');
     readln(a);
     writeln('Ingrese el valor de otro numero(Que no exceda de 10 digitos):');
     readln(b);
     if (a=b) then
     writeln('Los numeros son iguales.')
     else
     writeln('El menor valor de ambos numeros dados es: ',min(a,b));
     writeln('Presione la tecla Enter para continuar.');
     readln;
end;
procedure UsarMayus(var frase:string);
begin
     clrscr;
     writeln;
     writeln('A continuacion se mostrara un ejemplo de la funcion UpperCase:');
     writeln;
     writeln('Dame la frase que va a ser pasada a mayuscula:');
     readln(frase);
     writeln('A continuacion se mostrara la frase dada toda en mayusculas: ',Uppercase(frase));
     writeln('Presione la tecla Enter para continuar.');
     readln;
end;
procedure UsarMinus(var frase:string);
begin
     clrscr;
     writeln;
     writeln('A continuacion se mostrara un ejemplo de la funcion LowerCase:');
     writeln;
     writeln('Ingrese la frase que va a ser pasada a minuscula:');
     readln(frase);
     writeln('A continuacion se mostrara la frase dada toda en minuscula: ',Lowercase(frase));
     writeln('Presione la tecla Enter para continuar.');
     readln;
end;

procedure Librerias(var opcion:char); { Esta opción nos muestra el uso de dos librerias. }
begin
     textcolor(14);
     writeln('                   Menu de selección Librerias:');
     writeln;
     writeln;
     writeln('Libreria Math:');
     writeln;
     writeln('1.Funcion Max.');
     writeln('2.Funcion Min.');
     writeln;
     writeln;
     writeln('Libreria SySutils:');
     writeln;
     writeln('3.Funcion UpperCase.');
     writeln('4.Funcion LowerCase.');
     writeln;writeln;textcolor(red);
     writeln('Esc.Salir');
     opcion:=readkey;
     case opcion of
     '1':BuscarMaximo(a,b);
     '2':BuscarMinimo(a,b);
     '3':UsarMayus(frase);
     '4':UsarMinus(frase);
     #27:Fuera;  //#27 es el char que se asigna a la tecla ESC
     else
     textcolor(8);
     writeln('Opcion invalida.Por favor lea nuevamente.');
     writeln;
     writeln('Presione la tecla Enter para volver al menu y seleccione una opcion correcta.');
     readln;
     clrscr;
     end;
end;



procedure mostrarMenu(var opcion:char); { Este proceso es el menu principal de este programa. }
var
x:boolean;
begin

     repeat
      x:=true;
     if x then
     PlaySound('Menu.wav',0,SND_ASYNC);
     textcolor(5);
	Writeln('           ____                                 _                      ');
	Writeln('          | __ ) _   _ ___  ___  __ _ _ __ ___ (_)_ __   __ _ ___      ');
	Writeln('          |  _ \| | | / __|/ __|/ _` | ''_ ` _ \| | ''_ \ / _` / __|     ');
	Writeln('          | |_) | |_| \__ \ (__| (_| | | | | | | | | | | (_| \__ \     ');
	Writeln('          |____/ \__,_|___/\___|\__,_|_| |_| |_|_|_| |_|\__,_|___/     ');
    writeln;
    textcolor(3);
    writeln('                             Menu Principal   ');
    writeln;
    textcolor(3);
    writeln('                      Seleccione la Opcion que desea.');
    writeln;
    textcolor(2);
    writeln('                           1.Iniciar juego.');
    writeln;
    writeln('                           2.Ver reloj.');
    writeln;
    writeln('                           3.Uso de dos librerias.');
    writeln;
    writeln;
    writeln;
    textcolor(4);
    writeln('                           ESC.Salir.');
    textcolor(14);
     opcion:=readkey;
     clrscr;
     case opcion of
     '1':Jugar(contadorCondicion);
     '2':Hora(horas,minutos,segundos,centesimas);
     '3':Librerias(opcion);
     #27:Fuera; //#27 es el char que se asigna a la tecla ESC
     else
     textcolor(8);
     writeln('Opcion invalida.Por favor lea nuevamente.');
     writeln;
     writeln('Presione la tecla Enter para volver al menu y seleccione una opcion correcta.');
     readln;
     clrscr;
     end;
     until (opcion<>'');
end;
begin
     i:=0; // se inicializa en 0 para que entre al ciclo por primera vez
     while (i=0) do
     begin
          clrscr;
          mostrarMenu(opcion);
          i:=0;

     end;

end.

