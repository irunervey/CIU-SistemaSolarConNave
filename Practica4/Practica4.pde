float ang,angIncl;
float zcamerai;
float [] movimientoCamara, rotarCamara, posiciones;
float incremento;
PImage bg;
boolean mode, menu;
boolean movimiento;
ArrayList<Planeta>planetas;
nave camara;
void setup(){
  mode=false;
  movimiento=true;
  bg=loadImage("fondo.jpg");
  size(1000,1000,P3D);
  stroke(30);
  ang=360;
  menu=true;
  incremento=1;
  zcamerai=1200;//(height/2.0)/tan(PI+30.0/180.0);
  movimientoCamara=new float[]{0,0,0};
  rotarCamara=new float[]{0,0};
  posiciones=new float[]{0,0,0,0,0};
  angIncl=-45;
  planetas=new ArrayList<Planeta>();
  planetas.add(new Planeta("Sol",50,0.0,0.0,0.1,0.10,0.0));
  planetas.add(new Planeta ("Mercurio",30,90.0,0.10,1.01,100.0,52.0));
  planetas.add(new Planeta ("Venus",50,205.0,0.005,0.10,1.0,177.0));
  planetas.get(2).addLuna(10,60,0.05,0.0,10.0,70.0);
  planetas.get(2).addLuna(5,80,0.05,1.0,10.0,85.0);
  planetas.add(new Planeta("Tierra",20,337.0,0.0,0.20,1.0,307.0));
  planetas.get(3).addLuna(10,40,0.0,0.5,5.0,40.0);
  planetas.add(new Planeta("Marte",30,420.0,0.0,4.20,5.0,390.0));
  planetas.add(new Planeta("Jupiter",70,540.0,1.0,6.0,20.0,500.0));
  textSize(15);
  camara=new nave(width/2,height/2,zcamerai);
  for(Planeta planeta: planetas){
    planeta.cambiarColor((int)random(0,255),(int)random(0,255),(int)random(0,255));
  }
  sphere(100);
}

void draw(){
  
  if(menu){
    camera(width/2.0,height/2.0,900,width/2.0,height/2,0,0,1,0);
    background(0);
    textSize(18);
    String opciones="Pulsa ESC para salir del menu\nPulsa c para cambiar entre el modo camara y nave\nPulsa las flechas para girar la vista de la nave\nEl espacio asciende la nave mientras que el SHIFT la desciende\n"+
                    "La nave se depsplaza hacia delante con w y hacia atras con s\nEl desplazamiento lateral funciona con a y d\nCon z reinicias el giro de la vista de la nave, con r reinicias la posicion de la nave y con x reinicias las velocidades";
    fill(200,255,0);
    text(opciones,0,10);
  }else{
    background(bg);
    translate(width/2,height/2,0);
    if(!mode){
      inclinacion();
    }
    imprimirPlanetas();
    if(mode){
      for (int i = 0;i<3;i++){
        camara.acelerar(movimientoCamara[i],i);
        if(i<2){
          camara.girar(rotarCamara[i],i);
        }
      }
      float[] datos=camara.getDatos();
      String velocidades="VelocidadX: "+datos[0]+"\nVelocidadY: "+datos[1]+"\nVelocidadZ: "+datos[2];
      textSize(3);
      posiciones=camara.movimiento();
      camera(posiciones[0],posiciones[1],posiciones[2],posiciones[3],posiciones[4],posiciones[5],0,1,0);
      pushMatrix();
      translate(posiciones[0],posiciones[1],posiciones[2]);
      text(velocidades,-50,+30,-100);
      popMatrix();
      textSize(15);
    } else{
      camera(width/2.0,height/2.0,zcamerai,width/2.0,height/2,0,0,1,0);
    }
  }
}

void inclinacion(){
  rotateX(radians(angIncl));
}

void imprimirPlanetas(){
  for(Planeta planeta:planetas){
      planeta.printPlaneta();
  }
}

void keyReleased(){
  if(key=='a'||key=='A'){
      movimientoCamara[0]=0.0;
    }
    if(key=='d'||key=='D'){
      movimientoCamara[0]=0.0;
    }
    if(key=='w'||key=='W'){
      movimientoCamara[2]=0.0;
    }
    if(key=='s'||key=='S'){
      movimientoCamara[2]=0.0;
    }
    if(key=='x'||key=='X'){
      camara.parar();
    }
    if(key==' '){
        movimientoCamara[1]=-0.0;
    }
    if(key=='z'||key=='Z'){
      camara.reiniciarCamara();
    }
    if(key == CODED){
      if(keyCode==UP){
         rotarCamara[1]=0.0;
      }
      if(keyCode==DOWN){
         rotarCamara[1]=0.0;
      }
      if(keyCode==LEFT){
         rotarCamara[0]=0.0;
      }
      if(keyCode==RIGHT){
         rotarCamara[0]=0.0;
      }
      if(keyCode==SHIFT){
          movimientoCamara[1]=0.0;
      }
    }
}

void keyPressed(){
  if(key==ESC){
    key=0;
    if(menu){
        menu=false;
      }else{
        menu=true;
      }
  }
  if(!menu){
    if(key== 'p'||key=='P'){
       movimiento=!movimiento;
       for(Planeta planeta:planetas){
        planeta.movimientoPlanetas(movimiento);
      } 
    }
    if(key=='c'||key=='C'){
      if(mode){
        mode=false;
      }else{
        mode=true;
      }
    }
    if(mode){
      if(key=='a'||key=='A'){
        movimientoCamara[0]=-0.1;
      }
      if(key=='d'||key=='D'){
        movimientoCamara[0]=0.1;
      }
      if(key=='w'||key=='W'){
        movimientoCamara[2]=-0.1;
      }
      if(key=='s'||key=='S'){
        movimientoCamara[2]=0.1;
      }
      if(key==' '){
        movimientoCamara[1]=-0.1;
      }
      if(key=='r'||key=='R'){
        camara.desplazar(width/2,height/2,zcamerai);
      }
      if(key == CODED){
        if(keyCode==UP){
           rotarCamara[1]=-1.0;
        }
        if(keyCode==DOWN){
           rotarCamara[1]=1.0;
        }
        if(keyCode==LEFT){
           rotarCamara[0]=-1.0;
        }
        if(keyCode==RIGHT){
           rotarCamara[0]=1.0;
        }
        if(keyCode==SHIFT){
          movimientoCamara[1]=0.1;
        }
      }
    }
  }
}
