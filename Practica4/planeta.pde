class Planeta{
  int size;
  float posX, angle, incremento, maxX, pos, velr, anguloRot, vel;
  ArrayList <Luna> lunas;
  boolean movimiento;
  String nombre;
  int[] colo;
  Planeta(String nom,int siz, float posi, float increment,float velocidad, float velocidadr,float max){
    size=siz;
    movimiento =true;
    posX=posi;
    pos=posi;
    incremento=increment;
    vel=velocidad;
    angle=0;
    anguloRot=0;
    velr=velocidadr;
    maxX=max;
    nombre=nom;
    lunas=new ArrayList<Luna>();
    colo= new int[]{0,0,0};
  }
  
  void printPlaneta(){
    pushMatrix();
    traslacion();
    rotacion(false);
    fill(colo[0],colo[1],colo[2]);
    sphere(size);
    fill(255,255,255);
    for(Luna luna:lunas){
      luna.printLuna();
    }
    popMatrix();
  }
  
  void rotacion(boolean rot){
    if(rot){
      rotateY(radians(angle));
      if (movimiento){
        angle-=vel;
        if(angle<0){
          angle=360+angle;
        }
      }
    } else{
      rotateY(radians(anguloRot));
      if (movimiento){
        anguloRot-=velr;
        if(anguloRot<0){
          anguloRot=360+anguloRot;
        }
      }
    }
  }
  void traslacion(){
    
    rotacion(true);
    translate(pos,0,0);
    imprimirTexto();
    
    if(movimiento){
      if (pos+incremento>maxX||pos+incremento < posX ){
        incremento*=(-1);
      }
      pos+=incremento;
    }
   
  }
  
  void addLuna(int lsiz, float lposi, float lincrement,float lvelocidad, float lvelocidadr,float lmax){
    lunas.add(new Luna(lsiz, lposi, lincrement,lvelocidad-velr, lvelocidadr,lmax));
    
  }
  void movimientoPlanetas(boolean mover){
    movimiento=mover;
    for(Luna luna:lunas){
      luna.movimientoLunas(mover);
    }
    
  }
  
  void imprimirTexto(){
    rotateY(radians(-angle));
    text(nombre,(size/2),-size);
    rotateY(radians(angle));
  }
  void cambiarColor(int color0,int color1,int color2){
    colo[0]=color0;
    colo[1]=color1;
    colo[2]=color2;
  }
}
